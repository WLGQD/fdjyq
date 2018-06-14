package cn.zk.fdjyq.util;

/**
 * @author XKK
 * @create 2018-05-28 9:41
 * @desc
 **/

public class ChaZhao {

    public void Fun1(int[] arr){
        int temp =0;
        for (int i = 0; i < arr.length-1; i++) {
            for (int j = 0; j < arr.length-1-i; j++) {
                if (arr[j+1]<arr[j]){
                    temp =arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
    }
}