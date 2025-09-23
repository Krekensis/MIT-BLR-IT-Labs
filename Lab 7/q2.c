#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

// ---------- CHAR STACK ----------
struct CharNode {
    char data;
    struct Node* next;
};

// Stack operations
void push(struct Node** top, char c) {
    struct Node* temp = (struct Node*)malloc(sizeof(struct Node));
    temp->data = c; temp->next = *top; *top = temp;
}
char pop(struct Node** top) {
    if(!*top) return '\0';
    struct Node* temp = *top;
    char c = temp->data;
    *top = temp->next;
    free(temp);
    return c;
}
char peek(struct Node* top) { return top ? top->data : '\0'; }
int precedence(char c) {
    if(c=='^') return 3;
    if(c=='*'||c=='/') return 2;
    if(c=='+'||c=='-') return 1;
    return 0;
}

// ---------- INT STACK ----------
struct IntNode {
    int data;
    struct IntNode* next;
};

void pushInt(struct IntNode** top, int val) {
    struct IntNode* temp = (struct IntNode*)malloc(sizeof(struct IntNode));
    temp->data = val; temp->next = *top; *top = temp;
}
int popInt(struct IntNode** top) {
    if (!*top) {
        printf("Stack underflow\n");
        exit(1);
    }
    struct IntNode* temp = *top;
    int val = temp->data;
    *top = temp->next;
    free(temp);
    return val;
}

// ---------- i. Infix to Postfix (with spaces) ----------
void infixToPostfix(char* infix, char* postfix) {
    struct Node* stack = NULL;
    int k = 0;
    for (int i = 0; infix[i]; i++) {
        char c = infix[i];
        if (isdigit(c)) {
            // collect full number
            while (isdigit(infix[i])) {
                postfix[k++] = infix[i++];
            }
            postfix[k++] = ' '; // delimiter
            i--; // step back
        }
        else if (c=='(') pushChar(&stack, c);
        else if (c==')') {
            while (stack && peekChar(stack)!='(') {
                postfix[k++] = popChar(&stack);
                postfix[k++] = ' ';
            }
            popChar(&stack); // remove '('
        }
        else if (c=='+'||c=='-'||c=='*'||c=='/'||c=='^') {
            while (stack && precedence(peekChar(stack)) >= precedence(c)) {
                postfix[k++] = popChar(&stack);
                postfix[k++] = ' ';
            }
            pushChar(&stack, c);
        }
    }
    while (stack) {
        postfix[k++] = popChar(&stack);
        postfix[k++] = ' ';
    }
    postfix[k] = '\0';
}

// ii. Evaluate Postfix
int evaluatePostfix(char* postfix) {
    struct Node* stack = NULL;
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
    return popInt(&stack);
}


int main() {
    char infix[100], postfix[200];
    printf("Enter infix expression: ");
    fgets(infix, sizeof(infix), stdin);
    infix[strcspn(infix, "\n")] = 0;

    infixToPostfix(infix, postfix);
    printf("Postfix: %s\n", postfix);

    printf("Postfix evaluation: %d\n", evaluatePostfix(postfix));
    return 0;
}
