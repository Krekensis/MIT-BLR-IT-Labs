#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

struct Node {
    char data;
    struct Node* next;
} Node;

// Stack operations
void push(Node** top, char c) {
    Node* temp = (Node*)malloc(sizeof(Node));
    temp->data = c; temp->next = *top; *top = temp;
}
char pop(Node** top) {
    if(!*top) return '\0';
    Node* temp = *top;
    char c = temp->data;
    *top = temp->next;
    free(temp);
    return c;
}
char peek(Node* top) { return top ? top->data : '\0'; }
int precedence(char c) {
    if(c=='^') return 3;
    if(c=='*'||c=='/') return 2;
    if(c=='+'||c=='-') return 1;
    return 0;
}

// i. Infix to Postfix
void infixToPostfix(char* infix, char* postfix) {
    Node* stack = NULL;
    int k = 0;
    for(int i=0; infix[i]; i++){
        char c = infix[i];
        if(isalnum(c)) postfix[k++] = c;
        else if(c=='(') push(&stack,c);
        else if(c==')'){
            while(stack && peek(stack)!='(') postfix[k++] = pop(&stack);
            pop(&stack); // remove '('
        } else {
            while(stack && precedence(peek(stack))>=precedence(c))
                postfix[k++] = pop(&stack);
            push(&stack,c);
        }
    }
    while(stack) postfix[k++] = pop(&stack);
    postfix[k] = '\0';
}

// ii. Evaluate Postfix
int evaluatePostfix(char* postfix) {
    Node* stack = NULL;
    for(int i=0; postfix[i]; i++){
        char c = postfix[i];
        if(isdigit(c)) push(&stack, c-'0'); // push as int
        else {
            int b = pop(&stack);
            int a = pop(&stack);
            switch(c){
                case '+': push(&stack, a+b); break;
                case '-': push(&stack, a-b); break;
                case '*': push(&stack, a*b); break;
                case '/': push(&stack, a/b); break;
            }
        }
    }
    return pop(&stack);
}

// Driver
int main() {
    char infix[100], postfix[100];
    printf("Enter infix expression: ");
    scanf("%s", infix);
    infixToPostfix(infix, postfix);
    printf("Postfix: %s\n", postfix);

    printf("Postfix evaluation: %d\n", evaluatePostfix(postfix));
    return 0;
}
