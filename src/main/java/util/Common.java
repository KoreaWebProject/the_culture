package util;

public class Common {
	//객체의 페이지 관리를 편하게 하기 위해 생성한 클래스
	//만약 A,B게시판이 존재한다면 두 게시판이 
	//한 페이지 당 보여줘야 하는 게시글의 수, 페이지 메뉴 수를 다르게
	//설정해 두고 가져다 쓸 수 있다
	
	//일반 게시판
	public static class Board{
		//한 페이지게 보여줄 게시글 갯수 5개
		public final static int BLOCKLIST = 5;
		
		//한 화면에 보여질 페이지 메뉴의 수
		//< 1 2 3 > 최대 페이지 수를 3개로 제한
		public final static int BLOCKPAGE = 3;
	}
	//사용할 때는 Common.Board.BLOCKLIST 같이 불러와서 사용
	
	//게시판이 여러 개인 경우 다른 게시판(공지)
	public static class Notice{
		//한 페이지게 보여줄 게시글 갯수 10개
		public final static int BLOCKLIST = 10;
		
		//한 화면에 보여질 페이지 메뉴의 수
		//< 1 2 3 4 5 > 최대 페이지 수를 3개로 제한
		public final static int BLOCKPAGE = 5;
	}
	
}
