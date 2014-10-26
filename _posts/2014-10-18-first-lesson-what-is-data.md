---
layout: post
title: "What is data?"
post_author: "Achaz von Hardenberg"
date: "18 Oct 2014"
category: Lesson.1
tags: Data
---
{% include JB/setup %}

*Achaz von Hardenberg* 
  
   
>"The scientist is not a person who gives the right answers, he's one who asks the right questions" - *Claude Lévi-Strauss, 1964*  
  
Every research, in ecology and evolution, or any other scientific field, starts with a question. For example, you may be interested in understanding why giraffes evolved a long neck, or what ecological factors influence the population dynamics of Alpine ibex, or maybe you want to infer the distribution range of an endangered species such as the Huemul deer in South America.[^1]  
  
If you cronically lack of scientific curiosity and fantasy[^2] you still can find interesting and "sexy" questions[^3] in recent papers such as this one by [Sutherland et al.(2013)](http://onlinelibrary.wiley.com/doi/10.1111/1365-2745.12025/abstract).  
  
But to find an answer to any of the above or other scientific questions, you will need data. Data are at the core of scientific enquiry and scientists are like very data-hungry caterpillars[^4]. But what is data exactly? There are many definitions of the term "data", but for the scope of this course about ecological data management and analysis, we will make up and use the following working definition: 

>"Ecological data is a collection of qualitative and quantitative characteristics of observations of the natural phenomena about which we want to draw conclusions"  

In the statistical jargon, these qualitative and quantitative characterstics are called **variables**, because they can assume different categorical or numeric values, in contrast with **constants** which are values fixed to a specific value (e.g. in the physical world the speed of light and the gravitational constant G). For example, we might be interested in knowing how fast cheetahs can run.  

<iframe width="560" height="315" src="//www.youtube.com/embed/U6K-F9Bjl8s" frameborder="0" allowfullscreen></iframe>
  
If we measure the running speed[^5] of say 10 cheetahs we will get 10 different measures, and if we organized well our data collection, these 10 measurements will be a **random sample** of the running speed of the **population** of all cheetahs in the world[^6]. Instead, if we measure the speed of 10 light beams, we will always get the same constant measure. In experimental settings, some variables are kept constant on purpose, to test the effect of one variable on an other under controlled conditions[^7]. 
  
From the above definition of ecological data we already can see that variables can be **qualitative** (e.g. sex, color, habitat type) or **quantitative** (any measurable characteristic such as weight, giraffe neck length, number of counted ibex or the running speed of cheetahs but also **events**: the presence or absence of a species in an area or "dead or alive" data (survival) of individually tagged subjects). Qualitative characteristics represent **categorial variables**, defined, in statistical languages such as [R](http://www.r-project.org), as **factors**. Quantitative variables can be **continuous** or **discrete**.  

**Continuous** variables are measurements which can take any value within a range (including values with significant digits after the decimal): the measured speed of our cheetahs can thus be any value (expressed as meters/second) between 0 and the maximum running speed theoretically possible for this species[^8]. 
  
The range from which we sample our observations is called also the **sampling space**.
  
**Discrete** variables can only take a finite number of values within the sampling space: The number of Alpine ibex counted in the Gran Paradiso National Park, for example, can be any positive integer above 0[^9]: you can count 2632 in one year, and 2721 in the next year, but you can not count 2676.5 Alpine ibex[^10]! This kind of discrete data are called also **count data**. Survival or Presence/Absence of a species in a particular area are an other example of discrete variables, with only 2 possible values (That's why they are called also **binomial data**: 1 for Survived or Present and 0 for Dead or Absent.   
  
We will see further on in the course how we can model all this different kind data to make statistical inference with it. 

>"Ecological data is often non-independent and grouped by some factor"

One of the main assumptions of classical statistical models is the independence of the observations. This means that we assume that each of our observations is a  random sample from the true population of all possible observations. In the real world this is rarely the case: If we measure repeatedly the speed of 10 Cheetahs, because of the difficoulties to collect this kind of data in the field,we may have collected more than one speed measurement for some of the individuals (Say 5 measurements for one of them, 3 for other 4 ones, and only 1 measurement for the remaining 5 individuals). If now we want to estimate the **mean** running speed of  cheetahs in the wild using this data, how would you proceed?  

The first thing you coud do is to  sum up the values of all your speed measurements and devide them by the total number of observations (You have a total of  5x1 + 3x4 + 1x5 = 22 speed measurements)[^11].  

However, while this is mathematicaly correct, it will most likely give us a biased estimate of the average speed of chetaahs in the wild: The only individual chetaah for which we have 5 measurements, contributed alone for 23% of all observations. Maybe it was easy to get so many measurements for this individual because he was constantly slower compared to the average of the population (maybe it was a sick individual). Our estimated mean is thus heavily influenced by the speed measurements this single individual providing us a lower average speed value than what we would get if our sampling would have been truly random. This problem is known in the literature as the **pooling fallancy**, and we will see, further on in the course about some clever ways to account for it. For now, just remember that ecological data more often than not is grouped by some **grouping factor**and you have to code this grouping factor in your data file, in order to be able to account for it in your further analyses. In the above example this grouping factor is the ID of the individual cheetahs in our sample, but it could be other characterstics, such as the sampling location or even the year in which the samples were collected.

But what is the right way to set up a data file for analysis? We will see that in our next module!


[^1]: You have to pardon me if here I used only zoological examples... Due to my own background, I have an obvious bias here, but this does not mean that this course is aimed  only at animal ecologists! In future lessons, I  will make the effort to present also examples from other domains!  
[^2]: In which case maybe you have chosen the wrong career...
[^3]: "Sexy" for the scientific community. Which means that if you succeed to find an answer to any of these you have very good chances to publish your results in some high ranking journal and thus become rich and famous... OK, maybe just a famous. Forget about becoming rich if you chose to become an ecologist! 
[^4]: The very hungry caterpillar, is a famous children picture book by Eric Carle and tells the story of a baby caterpillar with a perpetual craving for food.
[^5]:  If you are curious about how you could measure the running speed of cheetahs in the wild give a look to this recent paper by [Wilson et al. (2013)](http://www.nature.com/nature/journal/v498/n7453/full/nature12295.html%3FWT.ec_id%3DNATURE-20130613?message-global=remove&WT.ec_id=NATURE-20130613)
[^6]: The last figures say there are only about [7,500 cheetahs left in Africa!](http://www.cheetah.co.za/c_pop.html)
[^7]: We will get back to experimental designs later on in the course
[^8]: 29 m/s according to [Sharp (1997)](http://onlinelibrary.wiley.com/doi/10.1111/j.1469-7998.1997.tb04840.x/abstract)
[^9]: Including 0, if ibex should get locally extinct!
[^10]: Ever seen half an ibex in the wild?
[^11]: Remember the formula for the arithmetic mean? if not, refresh your memory [here](http://en.wikipedia.org/wiki/Arithmetic_mean)


