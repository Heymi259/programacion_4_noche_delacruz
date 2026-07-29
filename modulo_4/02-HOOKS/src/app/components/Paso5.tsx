import { useState, useEffect, useCallback } from 'react'
import { Pressable, StyleSheet, Text, View } from 'react-native'

type EstadoConn = 'desconectado' | 'conectando' | 'conectado' | 'error'

function useConexion(nombre: string) {
  const [estado, setEstado] = useState<EstadoConn>('desconectado')
  const [intentos, setIntentos] = useState(0)
  const [latencia, setLatencia] = useState<number | null>(null)
  const [disp, setDisp] = useState(0)

  useEffect(() => {
    if (estado !== 'conectando') return
    const t = setTimeout(() => {
      const falla = Math.random() < 0.4
      setIntentos(n => n + 1)
      if (falla) { setEstado('error'); setLatencia(null) }
      else { setLatencia(Math.floor(Math.random() * 150) + 20); setEstado('conectado') }
    }, 1200)
    return () => clearTimeout(t)
  }, [estado, disp])

  const reconectar = useCallback(() => { setEstado('conectando'); setDisp(d => d + 1) }, [])
  const reiniciar = useCallback(() => { setEstado('desconectado'); setIntentos(0); setLatencia(null) }, [])

  return { estado, intentos, latencia, reconectar, reiniciar }
}

const colMap: Record<string, string> = {
  desconectado: '#757575', conectando: '#1565c0', conectado: '#2e7d32', error: '#c62828',
}

function Tarjeta({ nombre, hook }: { nombre: string; hook: ReturnType<typeof useConexion> }) {
  const { estado, intentos, latencia, reconectar, reiniciar } = hook
  return (
    <View style={[styles.card, { borderColor: colMap[estado], width: '100%' }]}>
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' }}>
        <Text style={styles.cardTitle}>{nombre}</Text>
        <Text style={[styles.label, { color: colMap[estado] }]}>{estado.toUpperCase()}</Text>
      </View>
      <Text style={styles.cardSub}>Intentos: {intentos}{latencia !== null ? ` · ${latencia}ms` : ''}</Text>
      <View style={{ flexDirection: 'row', gap: 8, marginTop: 8 }}>
        <Pressable
          style={({ pressed }) => [styles.btn, estado === 'conectando' ? styles.btnGray : styles.btnOn, pressed && { opacity: 0.7 }, { flex: 1 }]}
          onPress={reconectar}
          disabled={estado === 'conectando'}
        >
          <Text style={styles.btnT}>
            {estado === 'desconectado' ? 'Conectar' : estado === 'conectando' ? 'Conectando…' : estado === 'conectado' ? 'Reconectar' : 'Reintentar'}
          </Text>
        </Pressable>
        <Pressable
          style={({ pressed }) => [{ paddingHorizontal: 16, borderRadius: 8, borderWidth: 1, borderColor: '#1565c0', justifyContent: 'center' }, pressed && { opacity: 0.7 }]}
          onPress={reiniciar}
        >
          <Text style={{ color: '#1565c0', fontSize: 13 }}>Reset</Text>
        </Pressable>
      </View>
    </View>
  )
}

export default function Paso5() {
  const w = useConexion('web-02')
  const c = useConexion('cache-02')
  return (
    <View style={styles.c}>
      <Text style={styles.t}>Estado de Servicios</Text>
      <Tarjeta nombre="web-02" hook={w} />
      <Tarjeta nombre="cache-02" hook={c} />
    </View>
  )
}

const styles = StyleSheet.create({
  c: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, backgroundColor: '#f5f5f5', gap: 12 },
  t: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  card: { padding: 16, borderRadius: 10, borderWidth: 2, backgroundColor: '#fff', gap: 4 },
  cardTitle: { fontSize: 15, fontWeight: '600', color: '#1a1a1a' },
  cardSub: { fontSize: 13, color: '#666' },
  label: { fontSize: 12, fontWeight: '600', letterSpacing: 0.5 },
  btn: { paddingVertical: 12, borderRadius: 8, alignItems: 'center', paddingHorizontal: 20 },
  btnOn: { backgroundColor: '#1565c0' },
  btnGray: { backgroundColor: '#90a4ae' },
  btnT: { color: '#fff', fontWeight: '600', fontSize: 14 },
})
