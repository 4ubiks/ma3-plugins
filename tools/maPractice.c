#include "stdio.h"
#include "stdlib.h"
#include "string.h"

int numberGenerator();
void commandGenerator(char** ma_do, char** ma_this, char** ma_this_extra, char** ma_here, int do_size, int this_size, int thisthis_size, int here_size);

int main(){

    char *ma_do[] = {"Store", "Assign", "Edit", "Update", "Move", "Delete", "Copy", "Goto", "Select", "Stomp", "Label"};
    int ma_do_size = 11;

    char *ma_this[] = {"Cue", "Group", "Fixture", "Channel", "Preset", "Sequence"};
    int ma_this_size = 6;

    char *ma_this_extra[] = {"Thru", "+"};
    int ma_this_extra_size = 2;

    // number generator
    char *at = "At";
    char *ma_here[] = {"Full", "."};
    int ma_here_size = 2;

    int drill_tracker=0;

    while (1==1){
        if (getchar() != 0x0a){
	    break;
	};
        commandGenerator(ma_do, ma_this, ma_this_extra, ma_here, ma_do_size, ma_this_size, ma_this_extra_size, ma_here_size);	

	drill_tracker++;
    }

    printf("Drills completed: %d\n", drill_tracker);

    return 0;
}

int numberGenerator(){
    int a=rand() % 20;
    int M=rand() % 500+1;

    int number=15;

    int rounds=rand() % 1000;

    for (int i=0; i<rand(); i++){
        number = (a*number)%M;
    }

    return number;
}

void commandGenerator(char** ma_do, char** ma_this, char** ma_this_extra, char** ma_here, int do_size, int this_size, int thisthis_size, int here_size) {
    
    unsigned int at_exists =0;
    
    // DO 
    char* doma = ma_do[rand() % do_size];
    printf("%s ", doma);

    // THIS
    char* this = ma_this[rand() % this_size];
    printf("%s ", this);

    // // HERE
    char* here = ma_here[rand() % here_size];

    // if the `do` can be applied somewhere else, create an 'at' variable
    if ((strcmp(doma, "Store")==0 || strcmp(doma, "Assign")==0 || strcmp(doma, "Copy")==0) && (rand()%2) == 0){
        at_exists = 1;
    }

    // check 'Group', 'Preset', 'Channel'. if these exist, we don't want a "."
    if (strcmp(this, "Group")==0 || strcmp(this, "Preset") == 0 || strcmp(this, "Channel") == 0){
        here = "Full";
    }
    else {
        here = ".";
    }

    // 50/50 shot on whether we include "at" in the command:
    if (at_exists == 1 && (rand() % 2) == 0){
        printf("%d ", rand()%1000);
        printf("At ");
        printf("%s ", this);
        printf("%d", (rand() % 1000));

        return;
    }

    // if we have a subfixture, add the subfixture ID
    if (strcmp(here, ".") == 0){
        printf("%d", rand() % 10000);
        printf("%s", here);
        printf("%d", rand() % 100);
    }
    else if (strcmp(here, "XXX") == 0){
        int startNumber = rand() % 1000;
        printf("%d ", startNumber);
        printf("%s ", here);
        printf("%d", (startNumber + rand() % 1000));
    }
    else {
        // number
        printf("%d\n", rand() % 10000);
    }

}
