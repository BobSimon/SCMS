/**
 * Switchery Utils
 * author:cmchen 2018-7-21
 */

function SwitcheryUtils(){}

/**
 * set switchery status
 * @param switchElement
 * @param checkedBool
 */
SwitcheryUtils.setEnable = function(switchElement, checkedBool){

    if ((checkedBool && !switchElement.isChecked()) || (!checkedBool && switchElement.isChecked())) {
        switchElement.setPosition(true);
        switchElement.handleOnchange(true);
    }

}