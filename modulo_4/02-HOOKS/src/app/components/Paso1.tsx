import { useState } from 'react'
import { Pressable, StyleSheet, Text, View } from 'react-native'

export default function Paso1() {
  const [intentos, setIntentos] = useState(0)
  const [conectado, setConectado] = useState(false)

  function reintentar() {
    if (conectado) return
    const n = intentos + 1
    setIntentos(n)
    if (n >= 3) setConectado(true)
  }

  const texto = conectado ? '✓ Conectado a redis-01' : `Intento ${intentos} de 3 fallido`
  const color = conectado ? '#2e7d32' : '#c62828'

  return (
    <View style={styles.c}>
      <Text style={styles.t}>Conexión a Caché Redis</Text>
      <View style={[styles.card, { borderColor: color, width: '100%' }]}>
        <Text style={[styles.cardTitle, { color }]}>{texto}</Text>
        <Text style={styles.cardSub}>redis-01 · 10.0.2.20:6379</Text>
      </View>
      <Pressable
        style={({ pressed }) => [styles.btn, conectado ? styles.btnOff : styles.btnOn, pressed && { opacity: 0.7 }]}
        onPress={reintentar}
        disabled={conectado}
      >
        <Text style={styles.btnT}>{conectado ? 'Conectado' : 'Reintentar conexión'}</Text>
      </Pressable>
      <Pressable onPress={() => { setIntentos(0); setConectado(false) }}>
        <Text style={{ color: '#1565c0', marginTop: 8 }}>Reiniciar</Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  c: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, backgroundColor: '#f5f5f5', gap: 12 },
  t: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  card: { padding: 16, borderRadius: 10, borderWidth: 2, backgroundColor: '#fff', gap: 4 },
  cardTitle: { fontSize: 15, fontWeight: '600' },
  cardSub: { fontSize: 13, color: '#666' },
  btn: { width: '100%', paddingVertical: 12, borderRadius: 8, alignItems: 'center', paddingHorizontal: 20 },
  btnOn: { backgroundColor: '#1565c0' },
  btnOff: { backgroundColor: '#a5d6a7' },
  btnT: { color: '#fff', fontWeight: '600', fontSize: 14 },
})
