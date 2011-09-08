//  keyboardControl.js
//  
//
//  Created by Emile khattar August 10 2011
//  MIT Licensed
//




/*
 keyboardType:
 0 : Default
 1 : ASCII
 2 : Numbers+Puncutation
 3 : URL
 4 : Number Pad
 5 : Phone Pad
 6 : Name Phone Pad
 7 : Email
 */
/*
 returnKeyType:
 0 : Default
 1 : Go
 2 : Next
 3 : Done
 */
function keyboardControl()
{
	console.log('creating plugin keyboardControl');
};
keyboardControl.prototype.show = function(fieldId,keyboardType,returnType,initialValue)
{
        switch (keyboardType) {	

        case "url":
            keyboardType = 3;
        break;

        case "email":
            keyboardType = 7;
        break;

        default:
            keyboardType = 0;
        break;

        }


	   var config = [fieldId , keyboardType , returnType , initialValue];
	   console.log(config);
	   PhoneGap.exec(null, null, "keyboardControl", "show", config );

	   return; 
	
};

keyboardControl.prototype.hide = function(){
	//this.showed = 0;
	// PhoneGap.exec(null, null, "keyboardControl", "hide", ["hanna"]);
	
};


keyboardControl.prototype.callBack = function (e){
	//console.log(e);
	var cbData = JSON.parse(e);

	document.getElementById(cbData.arguments[1]).value = cbData.text;
};

keyboardControl.install = function()
{
    if(!window.plugins)
    {
        window.plugins = {};	
    }
    window.plugins.keyboardControl = new keyboardControl();
    return window.plugins.shareKit;
};
PhoneGap.addConstructor(keyboardControl.install);