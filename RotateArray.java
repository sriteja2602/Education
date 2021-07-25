
/*Program To LeftRotate An Array In Java*/

import java.util.*;

class Teja { 
    
    public static void main(String[] args) {
        
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the size of the array");
        int size=sc.nextInt();
        System.out.println();
        System.out.println("enter the array elements");
        int a[]=new int[size];
        for (int i = 0; i < a.length; i++) {
            a[i]=sc.nextInt();
        }
        System.out.println();
        System.out.println("Array elements are\n");
        for (int i = 0; i < a.length; i++) {
            System.out.print(a[i]+" ");
        }
        System.out.println();
        int a1[]=new int[size];
        System.out.println("Left Rotate by: ");
        int count=0;int s;
        int r=s=sc.nextInt();
        while (count<size-s && r<size) {
            a1[count]=a[r];
            r++;
            count++;
        }
        int j=0;
        count=size-s;
        while (j<r && count<size) {
            a1[count]=a[j];
            j++;
            count++;
        }
        System.out.println();
        System.out.println("After rotation array is");
        for (int i = 0; i < a1.length; i++) {
            System.out.print(a1[i]+" ");
        }
    }
  }
