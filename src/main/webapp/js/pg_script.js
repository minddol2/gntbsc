function autoHypenPhone(obj){
	var str = obj.value;

	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if( str.length < 4){
		tmp = str;
	}else if(str.length < 7){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
	}else if(str.length < 11){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
	}else{              
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
	}
	obj.value = tmp;
}

function autoHypenJumin(obj){
	var str = obj.value;

	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if( str.length < 7){
		tmp = str;
	}else{              
		tmp += str.substr(0, 6);
		tmp += '-';
		tmp += str.substr(6, 13);
	}
	obj.value = tmp;
}

var regTel = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
function check_mobile(obj) {
    if (!regTel.test(obj)) {
        return false
    }
    return true;
}

function uncomma(str) { 
    str = String(str); 
    return Number(str.replace(/,/g, ""));
}

function replaceAll(str, searchStr, replaceStr) {
	return str.split(searchStr).join(replaceStr);
}
