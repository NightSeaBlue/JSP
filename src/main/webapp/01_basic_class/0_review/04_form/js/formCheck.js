window.onload = function(){

		var frm = document.getElementById('frm');
		//var inputs = document.querySelectorAll("input");
		
		frm.onsubmit = function(evt) {
			/*이벤트의 전달 취소 및 동작 취소*/
			evt.stopPropagation();	
			evt.preventDefault();
			
			//alert(frm.agree.checked);
			if(!frm.agree.checked) {
				alert('반드시 체크해 주셔야 합니다!');
				return;
			} else {frm.submit();}
			
			//frm.submit();			// 서버로 데이터 전송
			
		}


	}