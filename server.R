library(shiny)
shinyServer(function(input, output) {
        
        calcBMR <- function() {
                s <- -161.0
                if(input$gender == "Male") s <- 5.0
                return(10.0*input$w + 6.25*input$h - 5.0*input$a + s)
        }
        calcTDEE <- function() {
                bmr <- calcBMR()
                mult <- switch(input$act,
                       "Sedentary" = 1.2,
                       "Lightly Active" = 1.375,
                       "Moderately Active" = 1.55,
                       "Very Active" = 1.725,
                       "Extra Active" = 1.9
                       )
                return(bmr * mult)
                
        }
        caloricDeficit <- function() {
                return(input$wl * 9000)
        }
        output$bmr <- renderText({paste("Your BMR is: ", calcBMR(), " calories")})
        output$tdee <- renderText({paste("Your TDEE is: ", calcTDEE(), " calories")})
        output$wla <- renderText({paste("You need to eat ",format(calcTDEE() - caloricDeficit()/7,digits=4), " calories per day to lose ", input$wl, " kg per week")})
})


