library(plotly)

#volcano is a numeric matrix 
volcano

#heatmap
fig <- plot_ly(z = volcano, type = "heatmap")
fig


#Contour

fig <- plot_ly(z = volcano, type = "contour", contours = list(showlabels = TRUE))
fig <- fig %>% colorbar(title = "Elevation \n in meters")

fig


#Smoothing Contour Lines

fig1 <- plot_ly(z = volcano, type = "contour", contours = list(showlabels = TRUE),
                    line = list(smoothing = 0.85))
fig1 <- fig1 %>% colorbar(title = "Elevation \n in meters")

fig2 <- subplot(fig,fig1)

fig2


#greyscale
fig <- plot_ly(z = volcano,colors = "Greys", type = "heatmap")
fig


#single color
vals <- unique(scales::rescale(c(volcano)))
o <- order(vals, decreasing = FALSE)
cols <- scales::col_numeric("Oranges", domain = NULL)(vals)
colz <- setNames(data.frame(vals[o], cols[o]), NULL)
fig <- plot_ly(z = volcano, colorscale = colz, type = "heatmap")
fig

#multi
fig <- plot_ly(z = volcano, colors = colorRamp(c("Black","Red","orange")), type = "heatmap")

fig



#density plot
dens <- with(diamonds, tapply(price, INDEX = cut, density))
df <- data.frame(
  x = unlist(lapply(dens, "[[", "x")),
  y = unlist(lapply(dens, "[[", "y")),
  cut = rep(names(dens), each = length(dens[[1]]$x))
)

fig <- plot_ly(df, x = ~x, y = ~y, color = ~cut)
fig <- fig %>% add_lines()
fig

#3d surface
#plot_ly(z = matrix(1:100, nrow = 10)) %>% add_surface()

#3d surface plot
fig <- plot_ly(z = ~volcano,type = 'surface')
fig

#Surface Plot With Contours
fig <- plot_ly(z = ~volcano) %>% add_surface(
  contours = list(
    z = list(
      show=TRUE,
      usecolormap=TRUE,
      highlightcolor="#ff0000",
      project=list(z=TRUE)
    )
  )
)
fig <- fig %>% layout(
  scene = list(
    camera=list(
      eye = list(x=1.87, y=0.88, z=-0.64)
    )
  )
)

fig

#Multiple Surfaces

z <- c(
  c(8.83,8.89,8.81,8.87,8.9,8.87),
  c(8.89,8.94,8.85,8.94,8.96,8.92),
  c(8.84,8.9,8.82,8.92,8.93,8.91),
  c(8.79,8.85,8.79,8.9,8.94,8.92),
  c(8.79,8.88,8.81,8.9,8.95,8.92),
  c(8.8,8.82,8.78,8.91,8.94,8.92),
  c(8.75,8.78,8.77,8.91,8.95,8.92),
  c(8.8,8.8,8.77,8.91,8.95,8.94),
  c(8.74,8.81,8.76,8.93,8.98,8.99),
  c(8.89,8.99,8.92,9.1,9.13,9.11),
  c(8.97,8.97,8.91,9.09,9.11,9.11),
  c(9.04,9.08,9.05,9.25,9.28,9.27),
  c(9,9.01,9,9.2,9.23,9.2),
  c(8.99,8.99,8.98,9.18,9.2,9.19),
  c(8.93,8.97,8.97,9.18,9.2,9.18)
)
dim(z) <- c(15,6)
z2 <- z + 1
z3 <- z - 1

fig <- plot_ly(showscale = FALSE)
fig <- fig %>% add_surface(z = ~z)
fig <- fig %>% add_surface(z = ~z2, opacity = 0.98)
fig <- fig %>% add_surface(z = ~z3, opacity = 0.98)

fig

#3d streamtube plot
df = read.csv('Dataset/streamtube-wind.csv')
#df = read.csv('https://raw.githubusercontent.com/plotly/datasets/master/streamtube-wind.csv')

fig <- df %>%
  plot_ly(
    type = 'streamtube',
    x = ~x,
    y = ~y,
    z = ~z,
    u = ~u,
    v = ~v,
    w = ~w,
    sizeref = 0.5,
    cmin = 0,
    cmax = 3
  ) 
fig <- fig %>%
  layout(
    scene = list(
      camera = list(
        eye = list(
          x = -0.7243612458865182,
          y = 1.9269804254717962,
          z = 0.6704828299861716
        )
        
      )
    )
  )

fig



#Starting Position and Segments

fig <- df %>%
  plot_ly(
    type = 'streamtube',
    x = ~x,
    y = ~y,
    z = ~z,
    u = ~u,
    v = ~v,
    w = ~w,
    starts = list(
      x = rep(80, 16),
      y = rep(c(20,30,40,50), 4),
      z = c(rep(0,4),rep(5,4),rep(10,4),rep(15,4))
    ),
    sizeref = 0.3,
    showscale = F,
    maxdisplayed = 3000
  ) 
fig <- fig %>%
  layout(
    scene = list(
      aspectratio = list(
        x = 2,
        y = 1,
        z = 0.3
      )
    ),
    margin = list(
      t = 20, b = 20, l = 20, r = 20
    )
  )

fig