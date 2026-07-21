import { useState, useEffect } from 'react'
import { Pressable, StyleSheet, Text, View } from 'react-native'

type EstadoPing = 'pinging' | 'ok' | 'timeout' | 'inactivo'

export default function Paso2() {
  const [latencia, setLatencia] = useState<number | null>(null)
  const [estado, setEstado] = useState<EstadoPing>('inactivo')
  const [activo, setActivo] = useState(false)
  const [ciclos, setCiclos] = useState(0)

  useEffect(() => {
    if (!activo) return
    const intervalo = setInterval(() => {
      setEstado('pinging')
      setTimeout(() => {
        const falla = Math.random() < 0.15
        if (falla) { setLatencia(null); setEstado('timeout') }
        else { setLatencia(Math.floor(Math.random() * 190) + 10); setEstado('ok') }
        setCiclos(c => c + 1)
      }, 400)
    }, 2000)
    return () => clearInterval(intervalo)
  }, [activo])

  const colores: Record<EstadoPing, string> = {
    pinging: '#1565c0', ok: '#2e7d32', timeout: '#c62828', inactivo: '#757575',
  }

  return (
    <View style={styles.c}>
      <Text style={styles.t}>Monitor de Ping — nginx-01</Text>
      <View style={styles.card}>
        <Text style={[styles.cardTitle, { color: colores[estado] }]}>{estado.toUpperCase()}</Text>
        <Text style={{ fontSize: 28, fontWeight: '700', color: '#1565c0' }}>
          {latencia !== null ? `${latencia} ms` : '— ms'}
        </Text>
        <Text style={styles.cardSub}>Ciclos: {ciclos} · nginx-01 · 10.0.2.30:80</Text>
      </View>
      <Pressable
        style={({ pressed }) => [styles.btn, activo ? styles.btnRed : styles.btnOn, pressed && { opacity: 0.7 }]}
        onPress={() => setActivo(a => !a)}
      >
        <Text style={styles.btnT}>{activo ? 'Detener ping' : 'Iniciar ping'}</Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  c: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, backgroundColor: '#f5f5f5', gap: 12 },
  t: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  card: { padding: 16, borderRadius: 10, borderWidth: 2, backgroundColor: '#fff', gap: 4, width: '100%' },
  cardTitle: { fontSize: 15, fontWeight: '600' },
  cardSub: { fontSize: 13, color: '#666' },
  btn: { width: '100%', paddingVertical: 12, borderRadius: 8, alignItems: 'center', paddingHorizontal: 20 },
  btnOn: { backgroundColor: '#1565c0' },
  btnRed: { backgroundColor: '#c62828' },
  btnT: { color: '#fff', fontWeight: '600', fontSize: 14 },
})
