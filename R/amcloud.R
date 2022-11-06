#' @title Create Wordcloud From Text
#'
#' @description Function for creating wordcloud from text
#'
#' @import htmltools
#' @importFrom fs path_package
#' @importFrom jsonlite toJSON
#' @importFrom glue glue
#'
#' @author Youness Bahi
#' @param x a text string that can be retrieve for the words cloud.
#' @param maxFontSize the size of the biggest words. It can be set in pixels, or in Percent; **When using percent value, the lower the percent value the bigger the size** default to ```30```.
#' @param fontFamily character, default to ```'Courier New'```.
#' @param accuracy numeric, How accurate Word Cloud will be when searching for suitable place for a word. The higher the accuracy - the more closely packed word will be. **Please note, higher accuracy comes at a cost of performance. Find your middle ground**. default to ```4```.
#' @param minWordLength numeric, default to ```2```.
#' @param maxCount numeric, default to ```200```.
#' @param steps numeric, default to ```25```.
#' @param rotation numeric, degree of rotation for the labels container.
#' @param minColor character, min color hex code. example: ```#7f919e```.
#' @param maxColor character, max color hex code. example: ```#333333```.
#' @param excludeWords character array, of words to exclude. example: ```c('word', 'to', 'remove')```.
#' @param bgColor character, background color hex code, default to ```#ffffff```.
#'
#' @export
amcloud <- function(x, maxFontSize = 30, fontFamily = 'Courier New', accuracy = 4, minWordLength = 2, maxCount = 200, steps = 15, rotation = 0,
                    minColor = '#7f919e', maxColor = '#2b2b2b', excludeWords = NULL, bgColor = '#ffffff') {
  exclude <-
    if (! is.null(excludeWords)) {
      jsonlite::toJSON(excludeWords)
    } else {
      jsonlite::toJSON('')
    }
  
  browsable(
    tagList(
      htmltools::tags$html(
        lang = "en",
        htmltools::tags$head(
          htmltools::tags$meta(charset = "UTF-8"),
          htmltools::tags$title("Word Cloud")
        ),
        htmltools::tags$body(
          style = glue::glue('background: {bgColor}'),
          htmltools::includeScript(paste0(fs::path_package('amcloud'), "/lib/amcloud-1.0.0/core/http_www.amcharts.com_lib_4_core.js")),
          htmltools::includeScript(paste0(fs::path_package('amcloud'), "/lib/amcloud-1.0.0/charts/http_www.amcharts.com_lib_4_charts.js")),
          htmltools::includeScript(paste0(fs::path_package('amcloud'), "/lib/amcloud-1.0.0/wordCloud/http_www.amcharts.com_lib_4_plugins_wordCloud.js")),
          htmltools::includeScript(paste0(fs::path_package('amcloud'), "/lib/amcloud-1.0.0/animated/http_www.amcharts.com_lib_4_themes_animated.js")),
          htmltools::tags$div(
            id                = "chartdiv",
            style             = "width: 100%; height: 100vh;",
            `data-text`       = x,
            `data-fontsize`   = maxFontSize,
            `data-fontfamily` = fontFamily,
            `data-accuracy`   = accuracy,
            `data-minlength`  = minWordLength,
            `data-maxcount`   = maxCount,
            `data-steps`      = steps,
            `data-rotation`   = rotation,
            `data-mincolor`   = minColor,
            `data-maxcolor`   = maxColor,
            `data-exclude`    = exclude
          ),
          htmltools::includeScript(paste0(fs::path_package('amcloud'), "/lib/amcloud-1.0.0/txt.js"))
        )
      )
    )
  )
}