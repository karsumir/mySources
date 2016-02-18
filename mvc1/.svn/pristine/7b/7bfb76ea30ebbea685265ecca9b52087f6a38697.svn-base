function mMemoList() {
	var arr;
	$.getJSON("memoList.do",function(data){
		arr = data;
		$.each(data,function(index,item){
			var li = $("<li></li>");
			var a = $("<a href='#detailmemo'></a>");
			var p1 = $("<p></p>");
			var p2 = $("<p></p>");
			var strong = $("<strong></strong>");
			
			strong.html(item["m_title"]);
			p1.append(strong);
			if(item["m_content"].length > 20)
				p2.html(item["m_content"].substr(0,20));
			else
				p2.html(item["m_content"]);
				
			$(a).click(function(){
				$("#memotitle").attr("value",item["m_title"]);				
				$("#memocontent").html(item["m_content"]);
				if(item["m_fname"] != "" && item["m_fname"] != null){						
					$("#memofile").attr("href","resources/upload/"+item["m_fname"]);
					$("#memofile").html(item["m_fname"]);
				}
				
				$("#memodelete").on("click", function(){
					if(confirm("삭제 하시겠습니까?"))
						location.href="deleteMemo.do?m_num="+item["m_num"];
				});
				
			});
			
			a.append(p1);
			a.append(p2);
			li.append(a);
			$("#memoview").append(li);
			$("#memoview").listview("refresh");
		});
		
	});
}