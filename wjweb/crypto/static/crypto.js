options = {
    backgroundColor: 'rgb(255, 255, 255)',
    tooltip: {
        formatter: "{a} <br/>{b} : {c}%"
    },
    series: [{
        startAngle: 180, 
        endAngle: 0,
        name: 'recommend',
        type: 'gauge',
        detail: { formatter: '{value}%' },
        axisLine: {   
            lineStyle: { 
                color: [
                    [0.2, 'rgb(255,0,0)'],
                    [0.4, 'rgb(255,99,71)'],
                    [0.6,'rgb(205,201,201)'],
                    [0.8,'rgb(135,206,255)'],
                    [1,'rgb(0,154,209)']
                ]
            }
        },
        title: {		
            color: 'rgb(0,154,209)',	
            offsetCenter: [0,"25%"]				
        },
        detail:{
            offsetCenter: [0,"50%"]
        },
        data:[{value : 100, name :'STRONG BUY'}]

    }]
};


function draw_echarts(indi){
    var recommend = ['STRONG SELL','SELL','NEUTRAL','BUY','STRONG BUY'];
    var colors = ['rgb(255,0,0)','rgb(255,99,71)','rgb(205,201,201)','rgb(135,206,255)','rgb(0,154,209)'];
    var myChart = echarts.init(document.getElementById('panel'));
    var index = parseInt(indi / 20);
    options.series[0].data[0].value = indi;
    options.series[0].data[0].name = recommend[index];
    options.series[0].title.color = colors[index];
    myChart.setOption(options);
}