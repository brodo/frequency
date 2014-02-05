demo1Button = document.querySelector('#demo1-start')
demo1Slider = document.querySelector('#demo1-frequency')

demo1Button.onclick = ->
  frequency = parseInt(demo1Slider.value, 10)
  lesson.demo1.toggle()
  lesson.demo1.setFrequency(frequency)
  if lesson.demo1.isOn()
    demo1Button.textContent = "Stop"
  else
    demo1Button.textContent = "Start"

demo1Slider.onchange = ->
  frequency = parseInt(demo1Slider.value, 10) 
  lesson.demo1.setFrequency(frequency)

demo2MultipleButton = document.querySelector('#demo2-multiple')
demo2BaseInput = document.querySelector('#demo2-base')
demo2MultipleButton.onclick = ->
  frequency = parseInt(demo2BaseInput.value, 10)
  lesson.demo2.playExponential(frequency)

demo3AddButton = document.querySelector('#demo3-add')
demo3BaseInput = document.querySelector('#demo2-base')
demo3AddButton.onclick = ->
  frequency = parseInt(demo3BaseInput.value, 10)
  lesson.demo3.playLinear(frequency)
