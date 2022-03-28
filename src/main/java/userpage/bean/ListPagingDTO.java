package userpage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ListPagingDTO {
	//현재페이지위치
		private int currentPage;
		//보여질 최대페이지 수
		private int pageBlock;
		//페이지하나당 글얼마나?
		private int pageSize;
		//총글수
		private int totalA;
		//[1]이런식으로 저장한다는뜻 총글수에 따라 페이지수 계산
		private StringBuffer pagingHTML;
		
		public void makePagingHTML() {
			/*이렇게 나오야함
			 * currentPage=1;
			 * totalA=22;
			 * 
			 * "[이전][4][5]"
			 */
			pagingHTML = new StringBuffer();
			int totalP=(totalA+pageSize-1)/pageSize;
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage = startPage + pageBlock -1;
			if(endPage>totalP) endPage = totalP;
			//if(startPage>pageBlock) 이어도됨
			if(startPage!=1)
				pagingHTML.append("<span id=paging onclick=listPaging("+(startPage-1)+")>Prev</span>");
			
			for(int i=startPage; i<=endPage;i++) {
				if(i==currentPage)
					pagingHTML.append("<span id=currentPaging onclick=listPaging("+i+")>"+i+"</span>");
				else
					pagingHTML.append("<span id=paging onclick=listPaging("+i+")>"+i+"</span>");
			}
			
			if(endPage<totalP)
				pagingHTML.append("<span id=paging onclick=listPaging("+(endPage+1)+")>Next</span>");
		}
}
