$(document).ready(function(){
	
	$("#container").addClass("start");

	$("nav li").click(function(){
		$("#container").css("max-width", "100%")
		
		var id=$(this).attr("data-rol");    
		$("nav li").removeClass("on");    
		$(this).addClass("on");    
		$(".content").removeClass("prev this next");     
		//클릭 시 가지고 있던 클래스를 모두 지운다 
		
		$("#" + id).addClass("this").prevAll().addClass("prev");    
		//클릭한 메뉴와 매칭 되는 id에 this 클래스를 지정하고 그 앞의 모든 <section> 태그는 .prev클래스를 지정한다    
		$("#" + id).nextAll().addClass("next");    
		//클릭한 메뉴와 매칭 되는 id의 뒤에 오는 <section> 태그는 .next 클래스를 지정한다     
	});

	
	//********************************************************
	//ajax 사용하기
	$(".book_roll li").click(function(){
			//	alert('ok');
		// (1) 이벤트 발생한 li 요소에서 data-url 값 가져오기
			var dataurl = $(this).attr('data-url');				// data-url 요소를 가지고 오도록 attr 활용
			//alert(dataurl);
			
		// (2)  class='notebook' 지정한 article의 요소에 ajax로 파일을 받아서 지정
			$.ajax({
				type : 'post',
				dataType : 'html',
				url : dataurl,							// url 로 보내서 정보만 가져옴
				success : function(data){
					$('.notebook').html(data);			// Ajax 실행 성공시 받은 data 의 type 이 html 이므로, 해당 클래스의 html을 넘겨준 data로 변환 가능
				}
							
			});
		
	});
});

