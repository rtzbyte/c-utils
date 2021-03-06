#include "../linked_list.h"
#include "../alloc.h"

linked_list_node*
linked_list_append(linked_list* list, void* data) {
  linked_list_node *new_node, *node = list->head;

  while(node->next) {
    node = node->next;
  }
  new_node = (linked_list_node*)alloc(sizeof(linked_list_node));
  new_node->data = data;
  new_node->next = NULL;
  node->next = new_node;

  list->size++;
  return new_node;
}
