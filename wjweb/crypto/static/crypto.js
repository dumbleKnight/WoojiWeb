function test(){
    var myChart = echarts.init(document.getElementById('panel'));
    myChart.setOption({
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
    });
}