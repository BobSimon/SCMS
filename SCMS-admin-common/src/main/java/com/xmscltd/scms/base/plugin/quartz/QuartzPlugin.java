package com.xmscltd.scms.base.plugin.quartz;

import com.jfinal.kit.Prop;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.Db;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Record;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * QuartzPlugin
 * com.xmscltd.scms.base.plugin.quartz
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-01
 * Time: 15:13
 * Version: V1.0.0
 */
public class QuartzPlugin implements IPlugin {

    private static final Logger logger = LoggerFactory.getLogger(QuartzPlugin.class);


    private Scheduler scheduler = null;
    private String jobConfig;
    private String confConfig = "quartz_config.properties";
    private Prop jobProp;

    public QuartzPlugin(String jobConfig, String confConfig) {
        this.jobConfig = jobConfig;
        this.confConfig = confConfig;
    }

    public QuartzPlugin(String jobConfig) {
        this.jobConfig = jobConfig;
        this.confConfig = "/quartz_config.properties";
    }

//    public QuartzPlugin() {
//        this.jobConfig = "/quartz_job.properties";
//        this.confConfig = "/quartz_config.properties";
//    }

    public QuartzPlugin() {
        try {
            if(StrKit.notBlank(confConfig)) {
                scheduler = new StdSchedulerFactory(confConfig).getScheduler();
            } else {
                scheduler = new StdSchedulerFactory().getScheduler();
            }
            logger.info("初始化调度器 ");
        } catch (SchedulerException ex) {
            logger.error("初始化调度器=> [失败]:" + ex.getLocalizedMessage());
        }
    }


    /**
     *初始化启动任务
     */
//    public void initJob() {
//
//        List<Record> jobs = Db.find("SELECT * FROM job_manager WHERE 1=1 AND is_enabled = 'Y'");
//
//        for (Record job : jobs) {
//            if ("Y".equals(job.getStr("is_enabled"))) {
//                String className = job.getStr("class");
//                Class<? extends Job> jobClazz = null;
//                try {
//                    jobClazz = Class.forName(className).asSubclass(Job.class);
//                } catch (Exception e) {
//                    System.out.println(className + "没有继承job,e==" + e);
//                    logger.error(className + "没有继承job,e==" + e);
//                    continue;
//                }
//                String name = job.getStr("name");
//                String group = job.getStr("group");
//                String cronExpression = job.getStr("cron_expression");
//                this.addJob(name, group, jobClazz, cronExpression);
//
//            }
//        }
//        this.start();
//
//    }

    /**
     * 添加简单任务
     * @param name
     * @param group
     * @param clazz
     * @param count 重复次数 null 时无限次重复
     * @param milliseconds 间隔毫秒 ，毫秒 秒 分 小时 选一个
     * @param seconds 间隔秒
     * @param minutes 间隔分
     * @param hours 间隔小时
     * @param startTime 开始时间
     * @param endTime 结束时间
     */
    public void addSimpleJob(String name, String group, Class<? extends Job> clazz,
                             Integer count, Long milliseconds, Integer seconds, Integer minutes,
                             Integer hours, Date startTime, Date endTime) {
        try {

            // 构造任务
            JobDetail job = newJob(clazz).withIdentity(name, group).build();
            // 构造任务触发器
            SimpleScheduleBuilder builder = SimpleScheduleBuilder.simpleSchedule();

            TriggerBuilder trgBuilder = newTrigger().withIdentity(name, group);
            //判断重复执行间隔
            if(milliseconds != null){
                builder.withIntervalInMilliseconds(milliseconds);
            } else if (seconds != null) {
                builder.withIntervalInSeconds(seconds);
            } else if(minutes != null) {
                builder.withIntervalInMinutes(minutes);
            }else if (hours != null) {
                builder.withIntervalInHours(hours);
            }
            //判断重复次数
            if(count != null || count >= 0){
                builder.withRepeatCount(count);
            } else {
                builder.repeatForever();
            }
            //判断开始结束时间
            if(startTime != null){
                trgBuilder.startAt(startTime);
            }else{
                trgBuilder.startNow();
            }
            trgBuilder.withSchedule(builder);
            if (endTime != null){
                trgBuilder.endAt(endTime);
            }
            Trigger trg = trgBuilder.build();
            // 将作业添加到调度器
            scheduler.scheduleJob(job, trg);
            logger.info("创建作业=> [作业名称：" + name + " 作业组：" + group + "] ");
            System.out.println("创建作业=> [作业名称：" + name + " 作业组：" + group + "] ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("创建作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
        }
    }

    /**
     * 添加Cron任务
     * @param name
     * @param group
     * @param clazz
     * @param cronExpression
     */
    public void addCronJob(String name, String group, Class<? extends Job> clazz, String cronExpression) {
        try {

            // 构造任务
            JobDetail job = newJob(clazz).withIdentity(name, group).build();
            // 构造任务触发器
            Trigger trg = newTrigger().withIdentity(name, group).withSchedule(cronSchedule(cronExpression)).build();
            // 将作业添加到调度器
            scheduler.scheduleJob(job, trg);
            logger.info("创建作业=> [作业名称：" + name + " 作业组：" + group + "] ");
            System.out.println("创建作业=> [作业名称：" + name + " 作业组：" + group + "] ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("创建作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
        }
    }
    /**
     * 移除任务(停止)
     * @param name
     * @param group
     */
    public void removeJobByNameAndGroup(String name, String group) {
        try {
            TriggerKey tk = TriggerKey.triggerKey(name, group);
            scheduler.pauseTrigger(tk);// 停止触发器
            scheduler.unscheduleJob(tk);// 移除触发器
            JobKey jobKey = JobKey.jobKey(name, group);
            scheduler.deleteJob(jobKey);// 删除作业
            logger.info("删除作业=> [作业名称：" + name + " 作业组：" + group + "] ");
            System.out.println("删除作业=> [作业名称：" + name + " 作业组：" + group + "] ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("删除作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
        }
    }

    /**
     * 暂停任务,暂停恢复后会补全暂停时间所缺少的任务
     * @param name
     * @param group
     */
    public void pauseJobByNameAndGroup(String name, String group) {
        try {
            JobKey jobKey = JobKey.jobKey(name, group);
            scheduler.pauseJob(jobKey);
            logger.info("暂停作业=> [作业名称：" + name + " 作业组：" + group + "] ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("暂停作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
        }
    }

    /**
     * 暂停所有作业
     */
    public void pauseAll() {
        try {
            scheduler.pauseAll();
            logger.info("暂停所有作业 => [成功]");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("暂停所有作业 => [失败]");
        }
    }
    /**
     * 恢复任务
     * @param name
     * @param group
     */
    public void resumeJobByNameAndGroup(String name, String group) {
        try {
            JobKey jobKey = JobKey.jobKey(name, group);
            scheduler.resumeJob(jobKey);
            logger.info("恢复作业=> [作业名称：" + name + " 作业组：" + group + "] ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("恢复作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
        }
    }
    /**
     * 恢复所有任务
     */
    public void resumeAll() {
        try {
            scheduler.resumeAll();
            logger.info("恢复所有作业 => [成功]");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("恢复所有作业 => [失败]");
        }
    }
    /**
     * 从数据库中找到已经存在的job，并重新开户调度
     */
    public void resumeJob() {
        try {

//            SchedulerFactory schedulerFactory = new StdSchedulerFactory();
//            Scheduler scheduler = schedulerFactory.getScheduler();
            //获取调度器中所有的触发器组
            List<String> triggerGroups = scheduler.getTriggerGroupNames();
            //重新恢复在tgroup1组中，名为trigger1_1触发器的运行
            for (int i = 0; i < triggerGroups.size(); i++) {
                List<String> triggers = scheduler.getTriggerGroupNames();
                for (int j = 0; j < triggers.size(); j++) {
                    Trigger tg = scheduler.getTrigger(new TriggerKey(triggers
                            .get(j), triggerGroups.get(i)));
                    // 根据名称判断
                    if (tg instanceof SimpleTrigger
                            || (tg instanceof CronTrigger)) {
                        // 恢复运行
                        scheduler.resumeJob(new JobKey(triggers.get(j),
                                triggerGroups.get(i)));
                    }
                }

            }
            logger.info("恢复中断的定时作业！");
            scheduler.start();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    /**
     * 调整时间
     * @param name
     * @param group
     * @param cronExpression
     */
    public void modifyCronJob(String name, String group, String cronExpression) {
        try {
            TriggerKey tk = TriggerKey.triggerKey(name, group);
            // 构造任务触发器
            Trigger trg = newTrigger().withIdentity(name, group).withSchedule(cronSchedule(cronExpression)).build();
            scheduler.rescheduleJob(tk, trg);
            logger.info("修改作业触发时间=> [作业名称：" + name + " 作业组：" + group + "] ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("修改作业触发时间=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
        }
    }
    /**
     * 调整时间
     * @param name
     * @param group
     * @param count
     * @param seconds
     */
    public void modifySimpleJob(String name, String group, Class<? extends Job> clazz,
                                Integer count, Long milliseconds, Integer seconds, Integer minutes,
                                Integer hours, Date startTime, Date endTime) {
        try {
            TriggerKey tk = TriggerKey.triggerKey(name, group);
            // 构造任务触发器
            SimpleScheduleBuilder builder = SimpleScheduleBuilder.simpleSchedule();

            TriggerBuilder trgBuilder = newTrigger().withIdentity(name, group);
            //判断重复执行间隔
            if(seconds != null){
                builder.withIntervalInSeconds(seconds);
            } else if (milliseconds != null) {
                builder.withIntervalInMilliseconds(milliseconds);
            } else if(minutes != null) {
                builder.withIntervalInMinutes(minutes);
            }else if (hours != null) {
                builder.withIntervalInHours(hours);
            }
            //判断重复次数
            if(count != null || count >=0 ){
                builder.withRepeatCount(count);
            } else {
                builder.repeatForever();
            }
            //判断开始结束时间
            if(startTime != null){
                trgBuilder.startAt(startTime);
            }else{
                trgBuilder.startNow();
            }
            trgBuilder.withSchedule(builder);
            if (endTime != null){
                trgBuilder.endAt(endTime);
            }
            Trigger trg = trgBuilder.build();
            scheduler.rescheduleJob(tk, trg);
            logger.info("修改作业触发时间=> [作业名称：" + name + " 作业组：" + group + "] ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("修改作业触发时间=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
        }
    }
    public void startJobs() {
        try {
            scheduler.start();
            logger.info("启动调度器 ");
            System.out.println("启动调度器 ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("启动调度器=> [失败]");
        }
    }

    /**
     * 启动插件
     * @return
     */
    @Override
    public boolean start() {
//        loadJobsFromProperties();
        resumeJob();
//        startJobs();
        return true;
    }

    /**
     * 停止插件
     * @return
     */
    @Override
    public boolean stop() {
        shutdown();
        return true;
    }

    /**
     * 停止调度器
     */
    public void shutdown() {
        try {
            scheduler.shutdown();
            logger.info("停止调度器 ");
            System.out.println("停止调度器 ");
        } catch (SchedulerException e) {
            e.printStackTrace();
            logger.error("停止调度器=> [失败]");
        }
    }

}
