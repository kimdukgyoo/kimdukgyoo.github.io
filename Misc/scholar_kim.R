## install.packages("scholar")
library(scholar)
library(ggplot2)
id <- 'AdwJwrEAAAAJ&hl'   ## 여기를 본인 아이디에 맞게 바꾸면 됨
cit <- get_citation_history(id)
pdf('scholar_citations_per_year.pdf')
ggplot(cit,aes(x=year,y=cites))+
    geom_bar(stat='identity')+
    theme_bw()+
    xlab('Year of Citation')+
    ylab('Google Scholar Citations per Year')+
    annotate('text',label=format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"),x=-Inf,y=Inf,vjust=1.5,hjust=-0.05,size=3,colour='gray')
dev.off()
pdf('scholar_cumulative_citations.pdf')
foo <- gcite::gcite_user_info('TXeKxGsAAAAJ',verbose=FALSE)
adjust <- foo$citation_indices$All[1]-sum(foo$overall_citations$n_citations)
ggplot(cit,aes(x=year,y=cumsum(cites)+adjust))+
    geom_bar(stat='identity')+
    theme_bw()+
    xlab('Year of Citation')+
    ylab('Google Scholar Cumulative Citations')+
    annotate('text',label=format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"),x=-Inf,y=Inf,vjust=1.5,hjust=-0.05,size=3,colour='gray')
dev.off()

#predict_h_index(id)

## 누적 인용회수와 매 년 인용 횟수가 그래프로 그려짐.
