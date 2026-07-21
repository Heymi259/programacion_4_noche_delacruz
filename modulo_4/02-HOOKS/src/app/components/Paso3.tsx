import { useRef, useState, useEffect } from 'react'
import { Pressable, StyleSheet, Text, TextInput, View, TextInput as RNTextInput } from 'react-native'

export default function Paso3() {
  const inputHostRef = useRef<RNTextInput>(null)
  const inputPuertoRef = useRef<RNTextInput>(null)
  const [host, setHost] = useState('')
  const [puerto, setPuerto] = useState('22')
  const intentosRef = useRef(0)
  const [ultimo, setUltimo] = useState('—')

  useEffect(() => { inputHostRef.current?.focus() }, [])

  function conectar() {
    intentosRef.current += 1
    setUltimo(`${host || 'servidor'}:${puerto} — intento #${intentosRef.current}`)
  }

  return (
    <View style={styles.c}>
      <Text style={styles.t}>Configurar Conexión SSH</Text>
      <View style={{ width: '100%', gap: 6 }}>
        <Text style={styles.label}>Host o IP</Text>
        <TextInput
          ref={inputHostRef}
          style={styles.input}
          value={host}
          onChangeText={setHost}
          placeholder="10.0.2.10"
          placeholderTextColor="#aaa"
          autoCapitalize="none"
          returnKeyType="next"
          onSubmitEditing={() => inputPuertoRef.current?.focus()}
        />
        <Text style={styles.label}>Puerto SSH</Text>
        <TextInput
          ref={inputPuertoRef}
          style={styles.input}
          value={puerto}
          onChangeText={setPuerto}
          placeholder="22"
          placeholderTextColor="#aaa"
          keyboardType="number-pad"
          returnKeyType="done"
        />
      </View>
      <Pressable
        style={({ pressed }) => [styles.btn, styles.btnOn, pressed && { opacity: 0.7 }]}
        onPress={conectar}
      >
        <Text style={styles.btnT}>Conectar</Text>
      </Pressable>
      <Text style={styles.cardSub}>Último: {ultimo}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  c: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, backgroundColor: '#f5f5f5', gap: 12 },
  t: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  label: { fontSize: 12, fontWeight: '600', letterSpacing: 0.5 },
  input: { borderWidth: 1, borderColor: '#ccc', borderRadius: 8, paddingHorizontal: 12, paddingVertical: 10, fontSize: 14, backgroundColor: '#fff', color: '#1a1a1a' },
  cardSub: { fontSize: 13, color: '#666' },
  btn: { width: '100%', paddingVertical: 12, borderRadius: 8, alignItems: 'center', paddingHorizontal: 20 },
  btnOn: { backgroundColor: '#1565c0' },
  btnT: { color: '#fff', fontWeight: '600', fontSize: 14 },
})
