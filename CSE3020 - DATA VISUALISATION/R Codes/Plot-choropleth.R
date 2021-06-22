#Example-1 
library(plotly)
df <- read.csv("Dataset/2014_world_gdp_with_codes.csv")
head(df)

fig <- plot_ly(df, type='choropleth', locations=df$CODE, z=df$GDP..BILLIONS., text=df$COUNTRY, colorscale="Blues")

fig



#Example-2
library(plotly)
install.packages(listviewer)
library(listviewer)

df <- read.csv("Dataset/worldhappiness.csv")
head(df)
s <- schema()
agg <- s$transforms$aggregate$attributes$aggregations$items$aggregation$func$values


l = list()
for (i in 1:length(agg)) {
  ll = list(method = "restyle",
            args = list('transforms[0].aggregations[0].func', agg[i]),
            label = agg[i]) 
  l[[i]] = ll
}

fig <- df %>%
  plot_ly(
    type = 'choropleth',
    locationmode = 'country names',
    locations = ~Country,
    z = ~HappinessScore,
    autocolorscale = F,
    reversescale = T,
    colorscale = 'Portland', 
    transforms = list(list(
      type = 'aggregate',
      groups = ~Country,
      aggregations = list(
        list(target = 'z', func = 'sum', enabled = T)
      )
    ))
  )
fig <- fig %>% layout(
  title = "<b>World Happiness</b>",
  geo = list(
    showframe = F,
    showcoastlines = F
  ),
  updatemenus = list(
    list(
      x = 0.25,
      y = 1.04,
      xref = 'paper',
      yref = 'paper',
      yanchor = 'top',
      buttons = l
    )
  )
)


fig


