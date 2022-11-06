/**
 * ---------------------------------------
 * This demo was created using amCharts 4.
 *
 * For more information visit:
 * https://www.amcharts.com/
 *
 * Documentation is available at:
 * https://www.amcharts.com/docs/v4/
 * ---------------------------------------
 */

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end


var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());
var fontSize = document.querySelector('#chartdiv').getAttribute('data-fontsize');
var fontFamily = document.querySelector('#chartdiv').getAttribute('data-fontfamily');
var acc = document.querySelector('#chartdiv').getAttribute('data-accuracy');
var minWordLength = document.querySelector('#chartdiv').getAttribute('data-minlength');
var maxCount = document.querySelector('#chartdiv').getAttribute('data-maxcount');
var steps = document.querySelector('#chartdiv').getAttribute('data-steps');
var rotation = document.querySelector('#chartdiv').getAttribute('data-rotation');
var maxColor = document.querySelector('#chartdiv').getAttribute('data-maxcolor');
var minColor = document.querySelector('#chartdiv').getAttribute('data-mincolor');
var exclude = document.querySelector('#chartdiv').getAttribute('data-exclude');

series.accuracy = parseInt(acc);
series.step = parseInt(steps);
series.rotationThreshold = 0.7;
series.maxCount = parseInt(maxCount);
series.minWordLength = parseInt(minWordLength);
series.labels.template.tooltipText = "{word}: {value}";
series.fontFamily = fontFamily;
series.maxFontSize = am4core.percent(parseInt(fontSize));
series.labelsContainer.rotation = parseInt(rotation);
series.excludeWords = JSON.parse(exclude);

series.heatRules.push({
    "target": series.labels.template,
    "property": "fill",
    "min": am4core.color(minColor),
    "max": am4core.color(maxColor),
    "dataField": "value"
});

series.dataFields.word = "tag";
series.dataFields.value = "weight";

var data_ = document.querySelector('#chartdiv').getAttribute('data-obj')
series.data = JSON.parse(data_);