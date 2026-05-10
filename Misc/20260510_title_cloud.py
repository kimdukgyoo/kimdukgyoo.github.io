import numpy as np
import matplotlib.pyplot as plt
from wordcloud import WordCloud, STOPWORDS

# memo on 5/10/2026: the corresponding R code creates a word cloud based on titles found in my Google Scholar page
# This Python code is an equivalent one with manually putting the titles in the entities.
titles = [
    "Clustering Standard Errors at the \"Session\" Level",
    "Positional concern and low demand for redistribution of the poor",
    "Big and small lies",
    "Population Uncertainty in Voluntary Contributions of Public Goods",
    "From helping hand to stumbling block: the ChatGPT paradox in competency experiment",
    "Multilateral bargaining over the division of losses",
    "Multilateral bargaining with proposer selection contest",
    "Vaccination lottery",
    "\u201cOne Bite at the Apple\u201d: Legislative Bargaining without Replacement",
    "Viable Nash equilibria: an experiment",
    "Probability matching and strategic decision making",
    "Recognition without replacement in legislative bargaining",
    "The coin strategy and charitable giving",
    "Sharing the burden of negative externalities: A tale of gridlock and accountability elusion",
    "A Theory of FAQs: Public Announcements with Rational Ignorance",
    "Rank versus inequality\u2014Does gender composition matter?",
    "The second\u2010tier trap: Theory and experimental evidence",
    "Why Are the Poor Conservative?",
    "Experience in the Same-Gender Environments and Low-Promotability Tasks",
    "Public demand and financial implications for retail CBDC: A randomized survey experiment",
    "Demand for Home Pension and Reverse Mortgage: An Information Provision Survey Experiment",
    "Positive and Negative Selection in Bargaining",
    "Good-Citizen Lottery",
    "Unveiling the Failure of Positive Selection",
    "Does Honesty Respond to Unrelated Luck?",
    "Penalty lottery",
    "Collective Proofreading and the Optimal Voting Rule",
    "Response time in choosing the most or least preferred option",
    "Essays On Applied Economics With Experimental Evidence",
]
text = " ".join(titles)

# Build a circular mask: 255 = "no words here", 0 = "words allowed".
size = 1200
radius = size // 2
y, x = np.ogrid[:size, :size]
mask = np.where((x - radius) ** 2 + (y - radius) ** 2 <= radius ** 2, 0, 255).astype(np.uint8)

stopwords = set(STOPWORDS)
stopwords.update({
    "using", "based", "via", "study", "analysis", "approach",
    "method", "methods", "results", "data", "use", "used",
    "new", "novel", "evidence", "matter",
})

wc = WordCloud(
    background_color="white",
    mask=mask,
    stopwords=stopwords,
    max_words=200,
    collocations=True,
    prefer_horizontal=0.9,
    colormap="viridis",
    contour_width=0,           # set e.g. 2 with contour_color="black" to outline the circle
).generate(text)

fig, ax = plt.subplots(figsize=(8, 8))
ax.imshow(wc, interpolation="bilinear")
ax.axis("off")
fig.tight_layout(pad=0)
fig.savefig("/mnt/user-data/outputs/title_cloud_circle.pdf",
            bbox_inches="tight", pad_inches=0.1)
fig.savefig("/mnt/user-data/outputs/title_cloud_circle.png",
            dpi=200, bbox_inches="tight", pad_inches=0.1)
plt.close(fig)
print("done")
