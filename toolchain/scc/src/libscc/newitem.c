#include <scc/scc.h>

void
newitem(struct items *items, char *item)
{
	if ((items->n + 1) < items->n)
		die("overflow in newitem (%u + 1)", items->n);

	items->s = xrealloc(items->s, (items->n + 1) * sizeof(char **));
	items->s[items->n++] = item;
}

