Context = window.AudioContext || window.webkitAudioContext

audioContext = new Context()
createOscillator = ->
  oscillator = audioContext.createOscillator()
  oscillator.connect(audioContext.destination)
  oscillator
oscillator = createOscillator()

setFrequency = (frequency) ->
  oscillator.frequency.value = frequency

toggle = ->
  switch oscillator.playbackState
    when oscillator.UNSCHEDULED_STATE
      oscillator.start(0)
    when oscillator.PLAYING_STATE
      oscillator.stop()
      oscillator = createOscillator()


playExponential = (startFrequency) ->
  oscillator1 = createOscillator()
  oscillator1.frequency.value = startFrequency;
  oscillator1.start(0)
  setTimeout((->
    oscillator1.stop()
    oscillator2 = createOscillator()
    oscillator2.frequency.value = startFrequency * 2;
    oscillator2.start()
    setTimeout((->
      oscillator2.stop()
    ),500)
  ), 500)

playLinear = (startFrequency) ->
  oscillator1 = createOscillator()
  oscillator1.frequency.value = startFrequency;
  oscillator1.start(0)
  setTimeout((->
    oscillator1.stop()
    oscillator2 = createOscillator()
    oscillator2.frequency.value = startFrequency + 100;
    oscillator2.start()
    setTimeout((->
      oscillator2.stop()
    ),500)
  ), 500)



isOn = -> oscillator.playbackState == 1


window.lesson =
  demo1:
    setFrequency: setFrequency
    toggle: toggle
    isOn: isOn
  demo2:
    playExponential: playExponential
  demo3:
    playLinear: playLinear
