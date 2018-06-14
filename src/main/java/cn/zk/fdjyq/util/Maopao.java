
package cn.zk.fdjyq.util;

import java.util.Arrays;
import java.util.Date;

public class Maopao {
	public static void main(String[] args) {
		
			int arr1[]={98,2,332,46,22,37,732,54,645,43,232,8,6,9,99};
			int arr2[] = new int[50000];//生成50000个数的随机数组
			for(int i=0;i<arr2.length;i++){
				arr2[i]=(int) (Math.random()*500000);
			}
			
//			int arr3[] = new int[50000];//生成50000个数的随机数组
//			for(int i=0;i<arr3.length;i++){
//				arr3[i]=(int) (Math.random()*20000);
//			}

		//	arr3 = arr2.clone();
			Date start1 =new Date();
			//Mao2(arr1);	// 测试两个冒泡法那个快
			Date start2 =new Date();
			Mao1(arr1);//假定有序冒泡方法
			Date start3 =new Date();
			long time1 = start2.getTime()-start1.getTime();  
			long time2 = start3.getTime()-start2.getTime();	 	 
			System.out.println("标准方法"+time1);//533
			System.out.println("假定有序方法"+time2);//259 
			
		//	Mao1(arr1);
		//	System.out.println("冒泡标准方法"+Arrays.toString(arr1));//[6, 7, 8, 8, 22, 37, 46, 98, 99]
		//	System.out.println("假定有序方法"+Arrays.toString(arr));//[6, 7, 8, 8, 22, 37, 46, 98, 99]
	}
	public static void Mao2(int a[]){//冒泡标准方法
		int temp;
		for(int i=0;i<a.length-1;i++){
			for(int j=0;j<a.length-1-i;j++){
				if(a[j]>a[j+1]){
					temp=a[j];
					a[j]=a[j+1];
					a[j+1]=temp;
				}
			}
		}
	}
	
	//{98,2,332,46,22,37,732,54,645,43,232,8,6,9,99}
	public static void Mao1(int a[]){//冒泡假定有序方法
		int temp;
		boolean sorted = true;
		for(int i=0;i<a.length-1;i++){
			System.out.println(i+1 +"趟");
			for(int j=0;j<a.length-1-i;j++){
				System.out.print("	"+(j+1) +"次");
				if(a[j]>a[j+1]){
					temp=a[j+1];
					a[j+1]=a[j];
					a[j]=temp;
					sorted =false;
				}
				System.out.println(Arrays.toString(a));
			}
			if (sorted){
				break;
			}

		}
	}
}