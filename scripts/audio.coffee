Context = window.AudioContext || window.webkitAudioContext

audioContext = new Context()
createOscillator = ->
  oscillator = audioContext.createOscillator()
  oscillator.connect(audioContext.destination)
  oscillator.started = false
  oscillator
oscillator = createOscillator()

setFrequency = (frequency) ->
  oscillator.frequency.value = frequency

toggle = ->
  if not oscillator.started
    oscillator.start(0)
    oscillator.started = true
  else
    oscillator.stop(0)
    oscillator = createOscillator()

playExponential = (startFrequency) ->
  oscillator1 = createOscillator()
  oscillator1.frequency.value = startFrequency;
  oscillator1.start(0)
  setTimeout((->
    oscillator1.stop(0)
    oscillator2 = createOscillator()
    oscillator2.frequency.value = startFrequency * 2;
    oscillator2.start(0)
    setTimeout((->
      oscillator2.stop(0)
    ),500)
  ), 500)

playLinear = (startFrequency) ->
  oscillator1 = createOscillator()
  oscillator1.frequency.value = startFrequency;
  oscillator1.start(0)
  setTimeout((->
    oscillator1.stop(0)
    oscillator2 = createOscillator()
    oscillator2.frequency.value = startFrequency + 100;
    oscillator2.start(0)
    setTimeout((->
      oscillator2.stop(0)
    ),500)
  ), 500)



isOn = -> oscillator.started


window.lesson =
  demo1:
    setFrequency: setFrequency
    toggle: toggle
    isOn: isOn
  demo2:
    playExponential: playExponential
  demo3:
    playLinear: playLinear
