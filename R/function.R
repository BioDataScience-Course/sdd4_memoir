# function

# package ----
SciViews::R

# pc_plot ----

#' Graphique pour les paramètres physico-chimique
#'
#' @param data Jeu de données
#' @param y La variable en ordonnées. exemple :"T" attention à mettre les guillements
#' @param x La variable en abscisse. attention, à mettre les guillemets
#' @param factor La variable facteur discriminente
#' @param rect_start Position de départs des encadrés grisés
#' @param rect_end Position de fins des encadrés grisés
#'
#' @return Un graphique adapté aux paramètres physico-chimiques
#' @export
#'
#' @examples
#'
#' pc %>.%
#   filter(., T != "NA") %>.%
#   pc_plot(data = ., y = "T", x = "number_day", factor = "code",
#           rect_start = 29.83 + 0:5, rect_end = (29.83 + 0:5) + 0.5)
#'
#'
pc_plot <- function(data, y, x, factor, rect_start, rect_end){

  a <- rect_start
  b <- rect_end
  data_rect <-tibble(x = a, y = b)

  #data[!is.na(data[ , y]), ] -> data

  chart(data, formula = as.formula(paste(y, "~", x))) +
    geom_point(f_aes(as.formula(paste(y, "~", x, "%col=%", factor)))) +
    geom_line(f_aes(as.formula(paste(y, "~", x, "%col=%", factor)))) +
    geom_rect(
      data = data_rect[data_rect$x >= min(data$number_day) & data_rect$x <= max(data$number_day), ],
      inherit.aes = FALSE, aes(xmin = x, xmax = y, ymin = -Inf, ymax = Inf, alpha = 0.002),
      show.legend = FALSE)
}
