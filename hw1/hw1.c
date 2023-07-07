#include<stdio.h>
#include<stdlib.h>
//Lupin Cai
//2480620
/* THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING ANY
SOURCES OUTSIDE OF THOSE APPROVED BY THE INSTRUCTOR. Lupin Cai*/

int isPrime(int n){
    /**
     this function is to determine whether a given number is prime or not
     the default for integer n is that it is a prime
     by dividing itself from 2 to n
     once n is divisable by a number between 0 and 2
     the boolean value for isPri changed from 1 to 0
     representing that n is not a prime
    */

    int isPri = 1;//true
        for (int i = 2; i < n; i++)
        {
            if (n%i==0)
            {
                isPri = 0;//false
                break;
            } 
        }
    return isPri;
}

void prime(int n){
    /**
     * this function displys the first n prime numbers
    */

    /**
     * initialization:
     * firstly, create an array "primes" with n + 1 just so that it can safely fit all the elements
     * secondly, we set the first term in the array to be 2
     * thirdly, we create a pointer for primes pointing at index 1, the second block of the array to start
    */
        int primes[n+1];  
            primes[0]=2;
        int j = 1;
        
    
        if (n==1)//corner case
        {
            printf("%d\n",2);
        }        
        else
        {
        for(int i = 1; j < n; i++)
            {   
                if (isPrime(i+2)==1)
                {
                    primes[j] = i+2;//store the primes in the array
                    j++;
                }
            }
        for(int i = 0; i < j-1; i++)
            {
                printf("%d, ", primes[i]);//prints out every element of the code
            }
        printf("%d\n", primes[j-1]);//return a new line
        }
}


//in this function, we created an array of character with a length that is one larger than 
// the input is a char, we create an integer named string length to get how many times that we need to use getchar() for
void rem(const char *s){
    
    int j = 0;
    int stringlength = 0;
    for (int i = 0; s[i] != '\0'; i++)
    {
        stringlength++;
    }
    char string[stringlength+1];//create an array that is one longer to store the non-vowel characters

    for(int i = 0; s[i]!='\0'; i++){
        if(!(s[i]=='a'||s[i]=='e'||s[i]=='i'||s[i]=='o'||s[i]=='u'||s[i]=='A'||s[i]=='E'||s[i]=='I'||s[i]=='O'||s[i]=='U'))
            {
                string[j] = s[i];//store the non-vowel characters into this new array
                j++;
            }
    } 
    printf("%s\n",s);//prints out the original string
    printf("%s\n",string);//prints out the modified string
}



void perfect(long n){
        int sum = 0;    //initialize the sum of factors of long n
        for(int i = 1; i < n-1; i++)
        {if(n%i==0)     //adding all the factor of n
        sum = sum + i;}

        if(n==sum)      //determine whether n is equal to all its factor
            printf("%ld is a perfect number\n", n);//true
        else
            printf("%ld is not a perfect number\n", n);//false
}


void nearest(void){
        int dum;            //create a dummy variable for later to determine whether the input is EOF
        char s[30] = "Enter a positive integer:";
        printf("%s\n",s);    
        char t[20];
        int index1;         //this is a pointer to get the elements from the user
        

        if ((dum = getchar())!=EOF)  //determine whether the input is EOF
        {
            for(int c = 1; index1!='\n';c++)
                {   t[0] = dum;
                    index1 = getchar();
                    t[c] = index1;           
                }

            int n = atoi(t);

            if (isPrime(n)==1)
                {   
                    printf("The number %d is a prime.\n",n);
                }
        
            else
                {
                    int i = 1;   //create two pointers: one goes forward and one goes backwards from the number enterred by the user
                    int j = 1;

                    for ( int k = 0;; k++)
                        {
                            if(isPrime(n+i)==1)
                            {break;}
                            else
                            {i = i+1;}
                        }        
                    
                    for ( int k = 0;; k++)
                        {
                            if(isPrime(n-j)==1)
                            {break;}
                            else
                            {j = j+1;}
                        }
        


                    //determine whether one is larger than the other, if the twos are equal, we return the smaller one
                    if(j<i)         
                        {
                            printf("The nearest prime to %d", n);
                            printf(" is %d.\n",n-j);
                        }
                    else if (i<j)
                        {
                            printf("The nearest prime to %d", n);
                            printf(" is %d.\n",n+i);
                        }
                    else
                        {
                            printf("The nearest prime to %d", n);
                            printf(" is %d.\n",n-j);
                        }
                }
        
            nearest(); //calls itself again until EOF is entered
 
        }
        
        else   //create a new line when the input is EOF
        {
            printf("\n");
        }
        
}