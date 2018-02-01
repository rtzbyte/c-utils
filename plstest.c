#include "playlist.h"
#include "open.h"
#include "buffer.h"
#include "byte.h"
#include "str.h"
#include <unistd.h>

playlist pls1, pls2;
static buffer outfile;
static char outbuf[1024];

static  buffer inbuf;


static void
playlist_process(playlist* pl, stralloc* title, stralloc* location, uint32 length) {
/*  buffer_putm(buffer_2, "Title: ", title->s, "\n", NULL);
  buffer_putm(buffer_2, "Location: ", location->s, "\n", NULL);
  buffer_puts(buffer_2, "Duration: ");
  buffer_putulong(buffer_2, length);
  buffer_putnlflush(buffer_2);

*/

  playlist_entry e;

  byte_zero(&e, sizeof(e));
  stralloc_copy(&e.title, title);
  stralloc_copy(&e.path, location);
  e.length = length;
  playlist_write_entry(&outfile, &pls1, &e);
}

int main(int argc, char *argv[]) {

  int opt;

  void (*playlist_fn)(playlist*,buffer*);
  playlist_type intype = M3U, outtype = XSPF;

  while((opt = getopt(argc, argv, "t:")) != -1) {
    switch(opt) {
    case 't':
      if(!str_diff(optarg, "pls")) outtype = PLS;
      else if(!str_diff(optarg, "m3u")) outtype = M3U;
      else if(!str_diff(optarg, "xspf"))  outtype = XSPF;
      break;
    default: /* '?' */
      buffer_putm(buffer_2, "Usage: ", argv[0], "[-t TYPE] [file]\n");
      exit(EXIT_FAILURE);
    }
  }

  const char* in_file = argv[optind];
  int in_fd; 

  if(in_file == NULL || (in_fd = open_read(in_file)) == -1) {
    buffer_putm(buffer_2, "No such file: ", in_file ? in_file : "(null)", "\n");
    buffer_flush(buffer_2);
    exit(1);
  }

  size_t i = str_rchr(in_file, '.');
  
  if(!str_diff(&in_file[i], ".m3u"))
    playlist_fn = &playlist_m3u /*, intype = M3U*/;
  //else if(!str_diff(&in_file[i], ".pls"))
  //  playlist_fn = &playlist_pls /*, intype = PLS*/;
  else if(!str_diff(&in_file[i], ".xspf"))
    playlist_fn = &playlist_xspf /*, intype = XSPF*/;

  playlist_init(&pls1);
  playlist_init(&pls2);
  /*
    buffer_mmapread(&inbuf, "/home/roman/Dokumente/vlc.xspf");
    playlist_xspf(&pls1, &inbuf);
    pls1.callback = playlist_process;
    playlist_read(&pls1);
    buffer_close(&inbuf);
  */


  playlist_settype(&pls1, outtype);

 //buffer_init(&outfile, write, open_trunc("playlist.out"), outbuf, sizeof(outbuf));
  buffer_init(&outfile, write, STDOUT_FILENO, outbuf, sizeof(outbuf));

  playlist_write_start(&outfile, &pls1);

  //buffer_mmapread(&inbuf, "/home/roman/nectarine.m3u");
  buffer_mmapread_fd(&inbuf, in_fd);

  playlist_fn(&pls2, &inbuf);

  pls2.callback = playlist_process;
  playlist_read(&pls2);
  buffer_close(&inbuf);

  playlist_write_finish(&outfile, &pls1);
  buffer_flush(&outfile);
}
