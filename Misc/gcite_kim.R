require(gcite)
require(httr)
require(rvest)
L = gcite_user_info("AdwJwrEAAAAJ&hl",verbose=FALSE)
paper_df = L$paper_df
authors = paper_df$authors
pdf("gcite_author_cloud.pdf")
author_cloud(authors)
dev.off()
pdf("gcite_title_cloud.pdf")
titles = paper_df$title
title_cloud(titles)
dev.off()
