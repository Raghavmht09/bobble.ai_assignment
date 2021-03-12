# bobble.ai_assignment
Solutions of booble.ai c++ assignment
Q1) Find the Word
Solution :
#include <bits/stdc++.h> 
using namespace std; 
  
const int ALPHABET_SIZE = 27; 
  
// trie node 
struct TrieNode 
{ 
    struct TrieNode *children[ALPHABET_SIZE]; 
  
    // isEndOfWord is true if the node represents 
    // end of a word 
    int frequency;
    bool isEndOfWord; 
}; 
  
// Returns new trie node (initialized to NULLs) 
struct TrieNode *getNode(void) 
{ 
    struct TrieNode *pNode =  new TrieNode; 
  
    pNode->isEndOfWord = false; 
  
    for (int i = 0; i < ALPHABET_SIZE; i++) 
        pNode->children[i] = NULL; 
  
    return pNode; 
} 
  
// If not present, inserts key into trie 
// If the key is prefix of trie node, just 
// marks leaf node 
void insert(struct TrieNode *root, string key,int freq) 
{ 
    struct TrieNode *pCrawl = root; 
  
    for (int i = 0; i < key.length(); i++) 
    { 
        int index = key[i] - 'a'; 
        if (!pCrawl->children[index]) 
            pCrawl->children[index] = getNode(); 
  
        pCrawl = pCrawl->children[index]; 
    } 
  
    // mark last node as leaf 
    pCrawl->isEndOfWord = true;
    pCrawl->frequency=freq;
} 
  
// Returns frequency if key presents in trie, else 
// 0 
int search(struct TrieNode *root, string key) 
{ 
    struct TrieNode *pCrawl = root; 
  
    for (int i = 0; i < key.length(); i++) 
    { 
        int index = key[i] - 'a'; 
        if (!pCrawl->children[index]) 
            return false; 
  
        pCrawl = pCrawl->children[index]; 
    } 
    if (pCrawl != NULL && pCrawl->isEndOfWord){
        return pCrawl->frequency;
    }
    else{
        return 0;
    }
} 
  
// Driver 
int main() 
{ 
    vector<int> frequency;
    vector<string>keys;
    ifstream myfile("EnglishDictionary.csv");
    string fre;
    string word_name;
    while(myfile.good()){
        getline(myfile,word_name,',');
        getline(myfile,fre,'\n');
        stringstream geek(fre); 
  
    // The object has the value fre and stream 
    // it to the integer freq
        int freq = 0; 
        geek >> freq; 
  
        keys.push_back(word_name);
        frequency.push_back(freq);  
    }
    myfile.close();
   
    struct TrieNode *root = getNode(); 
    string input;
    // Construct trie 
    for (int i = 0; i < frequency.size(); i++){
        
        string word = keys.at(i);
        int number = frequency.at(i);
        
        insert(root, word,number);

    } 
    cin>>input;
    int answer;
    answer=search(root,input);
    // Search for different keys 
    if(answer==0){
        cout<<"No";
    }
    else{
        cout<<"Yes , ";
        cout<<answer;
    } 
    return 0; 
} 

Compile: Go to any online c++ idea and run the above program
