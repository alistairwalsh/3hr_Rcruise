#R pearlers

example(functionname) brings up examples of usage for the given function. Try displaying examples for the min function:

	example(min)
	
	
	
	> deviation <- sd(pounds)
	> deviation
[1] 14500.62
We'll add a line on the plot to show one standard deviation above the mean (the top of the normal range)...

RedoComplete

	> abline(h = meanValue + deviation)

Hail to the sailor that brought us that 50,000-pound payday!

Now try adding a line on the plot to show one standard devation below the mean (the bottom of the normal range):

RedoComplete

	> abline(h = meanValue - deviation)

We're risking being hanged by the Spanish for this? Sorry, Smitty, you're shark bait.