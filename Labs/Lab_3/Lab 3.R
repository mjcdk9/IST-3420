# Mark Chafin
# IST-3420-101
# Lab 3



library("dplyr")

Borrower <- c("Student","Student","Faculty","Faculty","Other","Other" )
Material <- c("Book","CD","Book","CD","Book","CD")
Loan_Period <- c("4 weeks","1 week", "6 months","2 weeks","2 weeks","1 week")
df <- data.frame(Borrower, Material, Loan_Period)

calc_loan <- function(){
  
df %>% filter(Borrower == readline(prompt = "Who is the borrower? ") & Material == readline(prompt = "Book or CD? ")) %>%  select(Loan_Period)
    
}
