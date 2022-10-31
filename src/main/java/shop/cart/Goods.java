package shop.cart;

/*
 * 이 파일은 Java Resources / src 밑에 있어야한다.
 */
public class Goods {
	// Goods 내 변수 선언 (private로 선언해 외부에서 값의 변경 불가능 하게 받음 // 값을 입력하고 호출할 때 Setter & Getter 활용)
	private String  id;	 
	private String  name; 
	private int     price; 
	 
	public Goods(String id, String name, int price) { // Goods 생성자 생성시, id,name,price를 함께 받음 (기본생성자 없음)
		this.id = id; 
		this.name = name; 
		this.price = price; 
	} 
		 
	public void setPrice(int price) { 
		this.price = price; 
	} 
		 
	public String getId() { 
		return id; 
	} 
	 
	public String getName() { 
		return name; 
	} 
	 
	public int getPrice() { 
		return price; 
	}	 
}
