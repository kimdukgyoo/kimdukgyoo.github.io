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

### google scholar에서 abstract를 다운받은 다음 거기에 나온 words를 가지고 word cloud를 만드는 코드
### collaborators가 많은 경우 collaborator cloud도 예쁘게 나옴
