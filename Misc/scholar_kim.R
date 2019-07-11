## install.packages("scholar")
library(scholar)
library(ggplot2)
id <- 'AdwJwrEAAAAJ&hl'
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
