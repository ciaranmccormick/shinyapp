library(shiny)

shinyUI(fluidPage(
        fluidRow(
                column(3, wellPanel(
                        h3("Enter your details"),
                        sliderInput("h", "Height (cm):", min = 140, max = 215, value = 175,
                                    step = 1),
                        sliderInput("w", "Weight (kg):", min = 40, max = 120, value = 70,
                                    step = 0.2),
                        sliderInput("a", "Age (years):", min = 18, max = 100, value = 40,
                                    step = 1),
                        selectInput("act", "Activity Level",
                                    c("Sedentary", "Lightly Active",
                                      "Moderately Active", "Very Active",
                                      "Extra Active")
                        ),
                        radioButtons("gender", "Gender:",
                                     choices = c("Male", "Female")),
                        sliderInput("wl", "Weightloss (kg/week):", min = 0.0, max = 4, value = 0.5,
                                    step = 0.1)
                )),
                column(6,
                       h3("Your calorie requirements"),
                       h2("BMR: Basal Metabolic Rate."),
                       verbatimTextOutput("bmr"),
                       h2("TDEE: Total Daily Energy Expenditure"),
                       verbatimTextOutput("tdee"),
                       h2("Calories Deficit"),
                       verbatimTextOutput("wla")
                )
        )
))