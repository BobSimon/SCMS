/*EAS wfx author:sky 2015-06-25*/
!function(a){
	a.fn.typeTreeCombo=function(b){
		b=a.extend(!0,{},a.fn.typeTreeCombo.options,b);
		var c={typeData:null},
		d={
			typeData:null,
			getTempHtml:{
				getDropListWrap:function(){
					var b='<div class="ui-droplist-wrap" style="display:none;"><div class="droplist type-info" style="overflow:auto;"></div></div>';
					return a(b)
				},
				item:function(){
					var b='<div class="item" style="padding:5px 20px;"><em></em><a class="name" href="javascript:void(0)"></a><input type = "hidden" class="type-id" /></div> ';
					return a(b)
				},
				itemCon:function(){
					var b='<div class="item-con" style="display:none;"></div>';
					return a(b)
				}
			},
			getNode:function(a,b,c){
				for(var d=c[b],e=null,f=0,g=d.length;g>f;f++)if(d[f].id==a){
					e=d[f];
					break
				}
				return e
			},
			initLevelOne:function(c,e,f){
				var g=this,h=f[1];
				if (b.width == 0) {
					b.width = a(e).width();
				} else {
					a(e).css({width:b.width-2})
				}
				
				a(e).find("input.name").css({width: b.width-22});
				var i=d.getTempHtml.getDropListWrap();
				b.extraHTML&&i.append(a(b.extraHTML));
				d.getStyle.getInputStyle(e);
				i.css({position:"absolute"
//					, width:b.width-2
					}),
				a(e).after(i);
				var j=i.find(".droplist");
				j.css("min-width", b.width-4 + "px");
				if(h)
					for(var k=0,l=h.length;l>k;k++){
						var m=h[k],n=g.setItem(m);
						j.append(n)
					}else 
						j.append('<div class="tips">暂无数据</div>')
			},
			setChild:function(b,e){
				var f=this,
				g=a(e).next().find("a.name[data-typeid="+b+"]").parents(".item"),
				h=g.data("typeInfo");
				if(!h.isAdded){
					for(var i=c.typeData[h.level+1],j=[],k=0,l=i.length;l>k;k++)
						i[k].parentid==b&&j.push(i[k]);
					var m=d.getTempHtml.itemCon();
					g.after(m),h.isAdded=!0;
					for(var n=0,l=j.length;l>n;n++){
						var o=j[n],p=f.setItem(o);
						m.append(p)
					}
				}
				g.find("em").removeClass("em_open").addClass("em_close"),
				g.next(".item-con").eq(0).show();
				f.initItemListener();
			},
			setItem:function(a){
				var b=d.getTempHtml.item();
				return b.find("em").css({marginLeft:21*(a.level-1)}),
				b.find("em").addClass(1==a.isleaf?"em_leaf":"em_open"),
				a.isAdded=!1,b.data("typeInfo",a),b.find(".name").html(a.name).attr("data-typeid",a.id).attr("data-typenumber",a.number),b
			},
			addEvent:function(c,d){
				var e=this;
				a(document).on("click",function(c){
					var f=c.target||c.srcElement;
					var g=a(".ui-droplist-wrap", $(d).parent());
					var h=g.find(".droplist");
					if(0==a(f).closest(h).length&&0==a(f).closest(g).length)
						1==a(f).closest(a(d)).length?"none"!=g.css("display")?g.hide():a(f.parentElement).hasClass("ui-combo-disabled")||g.show():g.hide();
					else{
						var i=f.className.split(" ")[0];
						if(i == "item" || i == "name"){
							if(b.beforeSelected.length != 0){
								var value = a(f).find(".name").attr(b.valueType);
								if(i == "name"){
									value = a(f).parents(".item").find("a.name").attr(b.valueType);
								}
								if(!b.beforeSelected(value)){
									return;
								}
							}
						}
						switch(i){
							case"item":
								var j=a(f);
								b.isOnlyLeaf?a.isEmptyObject(j.data("typeInfo"))||1==j.data("typeInfo").isleaf?(a(d).find("input.name").val(a(f).find(".name").text()),a(d).find("input.cur-id").val(a(f).find(".name").attr(b.valueType)),g.hide()):bootbox.alert(b.isOnlyLeafTxt):(a(d).find("input.name").val(a(f).find(".name").text()),a(d).find("input.cur-id").val(a(f).find(".name").attr(b.valueType)),g.hide()),
								b.callback.nameClick(j);
								break;
							case"em_open":{
									var k=(a(f).parents(".item").data("typeInfo").parentid,a(f).parents(".item").data("typeInfo").id);a(f).parents(".item").data("typeInfo").level
								}
								e.setChild(k,d),a(d).next().find("a.name[data-typeid="+k+"]").parents(".item").siblings(".item").find("em.em_close").trigger("click");
								break;
							case"em_close":
								var k=a(f).parents(".item").find("a.name").attr("data-typeid");a(d).next().find("a.name[data-typeid="+k+"]").parents(".item").next(".item-con").hide(),a(d).next().find(".parent_"+k).children("em.em_close").trigger("click"),a(f).addClass("em_open").removeClass("em_close");
								break;
							case"name":
								var j=a(f).parents(".item");b.isOnlyLeaf?a.isEmptyObject(j.data("typeInfo"))||1==j.data("typeInfo").isleaf?(a(d).find("input.name").val(a(f).text()),a(d).find("input.cur-id").val(a(f).parents(".item").find("a.name").attr(b.valueType)),g.hide()):bootbox.alert(b.isOnlyLeafTxt):(a(d).find("input.name").val(a(f).text()),a(d).find("input.cur-id").val(a(f).parents(".item").find("a.name").attr(b.valueType)),g.hide()),
								b.callback.nameClick(j)
						}
					}
				})
			},
			initCurrentType:function(){
				var d=(b.curId,c.typeData),e=null,f=[];
				for(var g in d)
					for(var h=0,i=d[g].length;i>h;h++) {
						if (b.valueType === "data-typeid")
							d[g][h].id==b.curId&&(e=d[g][h]);
						else 
							d[g][h].number==b.curId&&(e=d[g][h]);
					}
					if(!a.isEmptyObject(e)){
						f.unshift(e.parentid);
						for(var j={level:e.level,id:e.id,parentid:e.parentid};j.level>1;)
							for(var k=0,l=d[j.level-1].length;l>k;k++)
								if(d[j.level-1][k].id==j.parentid){
									j.id=d[j.level-1][k].id,j.parentid=d[j.level-1][k].parentid,j.level=d[j.level-1][k].level,f.unshift(j.parentid);
									break
								}
								for(var m=0,n=f.length;n>m;m++)
									a("a.name[data-typeid="+f[m]+"]").parents(".item").find("em.em_open").trigger("click"),
									a("a.name[data-typeid="+f[m]+"]").parents(".item").find(".name").addClass("selected");
								return e
					}
			},
			getStyle:{
				getInputStyle:function(a){
					var b={};
					return b.left=a.offsetLeft,b.top=a.offsetTop,b.width=a.clientWidth,b.height=a.clientHeight,b
				}
			},
			initItemListener : function() {
				$(".ui-droplist-wrap .item").mouseenter(function() {
					$(this).addClass("item-in");
				});
				$(".ui-droplist-wrap .item").mouseleave(function() {
					$(this).removeClass("item-in");
				});
			}
		};
		return this.each(function(e,f){
			a.ajax({
				url:b.url,
				type:"get",
				dataType:"JSON",
				async:!1,
				timeout:60*1000,
				beforeSend:function(){},
				success:function(g){
					if(c.typeData=g.data,a(f).data("typeData",g.data),d.initLevelOne(e,f,c.typeData),d.addEvent(e,f),b.curId){
						var h=d.initCurrentType(b.curId);
						a.isEmptyObject(h)||(a(f).find("input.name").val(h.name),a(f).find("input.cur-id").val(b.curId))
					}
					b.callback.complete();
					/*
					if(200==g.code){
						
					} else { 
						bootbox.alert("获取数据失败，请联系管理员！")
					}
					*/
					d.initItemListener();
				},
				error:function(e){
				}
			})
		})
	},
	a.fn.typeTreeCombo.options = {
		url: "./itemclass.do?reqCode=queryItemClassTree",
		curId: "0",
		width: 200,
		isOnlyLeaf: false,
		isOnlyLeafTxt: "因本分类下有子分类，商品不能移动至此，请选择此分类的子分类或其他分类！",
		extraHTML: false,
		valueType: "data-typeid",
		beforeSelected:function(){},
		callback:{
			nameClick:function(){},
			complete:function(){}
		}
	}
}(jQuery);