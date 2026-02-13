#include<iostream>
#include<list>
using namespace std;

class HASH
{   private:
//size and ll
    int tablesize; //size
    //array of ll, with pointer 
    list<int> *table;
    
    public:
 //constructor   
    //constructor
    
    HASH(int size)
    {    //size and size to table
        tablesize=size;
        table= new list<int>[tablesize];
    }
    
    //index cal
    int hashfunction(int key)
    {
        return key% tablesize;
    
    }
    
    void insertelement(int key)
    {
        int index= hashfunction(key);
        table[index].push_back(key);
        
    }
    
    void deleteelement(int key)
    {
        int index=hashfunction(key);
        list<int> ::iterator i;
        for (i= table[index].begin(); i!=table[index].end(); i++)
        {
            if(*i==key)
            break;
        }
        if(i!=table[index].end())
        {
            table[index].erase(i);
        }
    }


void display()
{
    for (int i=0; i<tablesize; i++)
    {
        cout<<i;
    
    for(int value: table[i])
    {
        cout<<"-->"<<value;
    
    
    }
    cout<<endl;
    cout<<endl;
    
    
}
}
};
    
    int main()
    {
        int arr[]={10,20,50,70,60};
        
        int n=sizeof(arr)/sizeof(arr[0]);
        HASH hs(6);
        for (int i=0; i<n ; i++)
        {
            hs.insertelement(arr[i]);
        }
        hs.display();
        hs.deleteelement(50);
        hs.display();
        return 0;
        
    }