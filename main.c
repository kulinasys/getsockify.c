#include <unistd.h>
int dummymain(int argc,char *argv[]);

int main(int argc,char *argv[]) {
   chdir("/srv/www");
   return dummymain(argc,argv);
}
