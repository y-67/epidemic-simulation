function PlotView() {
  var options = {
    series: { shadowSize: 0 }, // drawing is faster without shadows
    xaxis: { show: true }
  };
  this.historySusceptible = new Array();
  this.historyRecovered = new Array();
  this.historyIll = new Array();
  var plot = $.plot($("#plot"), [], options);

  // Adds new data to the plot and refresh it.
  this.updateWithNewData = function(susceptible, ill, recovered) {
    var count = this.historySusceptible.length;
    this.historySusceptible.push([count, susceptible]);
    this.historyRecovered.push([count, recovered]);
    this.historyIll.push([count, ill]);
    this.refresh();
  };

  this.refresh = function() {
    plot.setData([
      //{ label: "Recovered", color: "rgb(0, 185, 0)",
                 //data: this.historyRecovered },
      //{ label: "Susceptible", color: "rgb(0, 0, 0)",
                 //data: this.historySusceptible },
                 { label: "Incubated & Infectious",
                   color: "rgb(185, 0, 0)",
                   data: this.historyIll}]);
    plot.setupGrid();
    plot.draw();
  };
}

