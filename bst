
#include <stdio.h>
#include<stdlib.h>
struct node{
    int data;
    struct node *left;
    struct node *right;
};
struct node *root=0;
struct node* create_node(int x){
    struct node *newnode=(struct node*)malloc(sizeof(struct node));
    newnode->data=x;
    newnode->left=0;
    newnode->right=0;
    return newnode;
}

struct node* insert_node(struct node *root,int x){
    if(root==NULL){
    return create_node(x);
    }
    if(x<root->data){
        root->left=insert_node(root->left,x);
    }
    else if(x>root->data){
        root->right=insert_node(root->right,x);
    }
    return root;}

void inorder(struct node *root){
    if(root!=NULL){
        inorder(root->left);
        printf("%d\t",root->data);
        inorder(root->right);
    }
}
void preorder(struct node *root){
    if(root!=NULL){
    printf("%d\t",root->data);
    preorder(root->left);
    preorder(root->right);}
    
}
void postorder(struct node *root){
    if(root!=NULL){
    postorder(root->left);
    postorder(root->right);
    printf("%d\t",root->data);}
}
void search(struct node *root,int key){
    if(root==0){
        printf("key not found\n");
    }
    else if(key<root->data){
        search(root->left,key);
    }
    else if(key>root->data){
        search(root->right,key);
    }
    else{
        printf("key found\n");}
}

struct node* findmin(struct node *root){
    while(root->left!=0){
        root=root->left;}
    return root;}

struct node* delete_node(struct node *root,int n){
    if(root==0){
        return root;
    }
    if(n<root->data){
        root->left=delete_node(root->left,n);
    }
    else if(n>root->data){
        root->right=delete_node(root->right,n);
    }
    else{
        if(root->left==0&&root->right==0){
            free(root);
            return NULL;
        }
        else if(root->left==0){
            struct node *temp=root->right;
            free(root);
            return temp;}
        else if(root->right==0){
            struct node *temp=root->left;
            free(root);
            return temp;}
        else{
            struct node *temp=findmin(root->right);
            root->data=temp->data;
            root->right=delete_node(root->right,temp->data);
            }}
        return root;} 
int main(){
    int choice;
    do{
     printf("\n<<<<MENU>>>\n1.insertion\n2.deletion\n3.traversal\n4.find node\n5.exit\n");
        printf("enter your choice:\n");
        scanf("%d",&choice);
        switch(choice){
            case 1:
             int num;
             printf("enter element to insert:\n");
             scanf("%d",&num);
             root=insert_node(root,num);
             break;
            case 2:
             int n;
             printf("enter node to delete:\n");
             scanf("%d",&n);
             root=delete_node(root,n);
             break;
            case 3:
             printf("\n<<<<traversal>>>>\n");
             printf("\ninorder=\n");
             inorder(root);
             printf("\npreorder=\n");
             preorder(root);
             printf("\npostorder=\n");
             postorder(root);
             break;
            case 4:
              int x;
              printf("enter element to search:\n");
              scanf("%d",&x);
              search(root,x);
              break;
            case 5:
              printf("exiting program.....\n);
              break;
            default:             
              printf("invalid\n");
        } }
    while(choice!=5);}
            
