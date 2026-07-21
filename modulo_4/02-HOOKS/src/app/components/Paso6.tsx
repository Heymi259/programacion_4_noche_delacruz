import { useRef, useState, useEffect, useCallback } from 'react'
import { Pressable, ScrollView, StyleSheet, Text, TextInput, View, TextInput as RNTextInput } from 'react-native'
import { useWindowDimensions, useColorScheme } from 'react-native'

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

export default function Paso6() {
  const { width } = useWindowDimensions()
  const esquema = useColorScheme()
  const dark = esquema === 'dark'
  const col = {
    bg: dark ? '#0d1b2a' : '#f0f4f8',
    card: dark ? '#1a2a3a' : '#fff',
    text: dark ? '#e8eaed' : '#1a1a1a',
    sub: dark ? '#9aa0a6' : '#666',
    border: dark ? '#2d3e50' : '#e0e0e0',
  }

  const { estado, intentos, latencia, reconectar, reiniciar } = useConexion('postgres-01')

  const inputRef = useRef<RNTextInput>(null)
  const [filtro, setFiltro] = useState('')
  useEffect(() => {
    const t = setTimeout(() => inputRef.current?.focus(), 300)
    return () => clearTimeout(t)
  }, [])

  const [logs, setLogs] = useState<string[]>([])
  useEffect(() => {
    if (estado !== 'conectado') return
    const intervalo = setInterval(() => {
      const ahora = new Date().toLocaleTimeString()
      const eventos = [
        `[${ahora}] Query en ${Math.floor(Math.random() * 50) + 5}ms`,
        `[${ahora}] Conexión desde 10.0.2.1`,
        `[${ahora}] Checkpoint WAL completado`,
        `[${ahora}] Vacío en sessions`,
      ]
      setLogs(p => [eventos[Math.floor(Math.random() * eventos.length)], ...p].slice(0, 20))
    }, 1500)
    return () => clearInterval(intervalo)
  }, [estado])

  const filtrados = filtro.trim() ? logs.filter(l => l.toLowerCase().includes(filtro.toLowerCase())) : logs

  const colC: Record<string, string> = {
    desconectado: '#757575', conectando: '#1565c0', conectado: '#2e7d32', error: '#c62828',
  }

  return (
    <View style={[styles.c, { backgroundColor: col.bg }]}>
      <Text style={[styles.t, { color: col.text }]}>Estado del Servidor</Text>

      <View style={[styles.card, { backgroundColor: col.card, borderColor: colC[estado], width: '100%' }]}>
        <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
          <Text style={[styles.cardTitle, { color: col.text }]}>postgres-01</Text>
          <Text style={[styles.label, { color: colC[estado] }]}>{estado.toUpperCase()}</Text>
        </View>
        <Text style={[styles.cardSub, { color: col.sub }]}>10.0.2.50 · PostgreSQL 16 · Puerto 5432</Text>
        <Text style={[styles.cardSub, { color: col.sub }]}>
          Intentos: {intentos}{latencia !== null ? ` · ${latencia}ms` : ''} · Tema: {esquema ?? 'auto'}
        </Text>
        <View style={{ flexDirection: 'row', gap: 8, marginTop: 10 }}>
          <Pressable
            style={({ pressed }) => [styles.btn, estado === 'conectando' ? styles.btnGray : styles.btnOn, pressed && { opacity: 0.7 }, { flex: 1 }]}
            onPress={reconectar}
            disabled={estado === 'conectando'}
          >
            <Text style={styles.btnT}>{estado === 'conectando' ? 'Conectando…' : 'Conectar / Reconectar'}</Text>
          </Pressable>
          <Pressable
            style={({ pressed }) => [{ paddingHorizontal: 14, borderRadius: 8, borderWidth: 1, borderColor: col.border, justifyContent: 'center' }, pressed && { opacity: 0.6 }]}
            onPress={reiniciar}
          >
            <Text style={{ color: col.sub, fontSize: 13 }}>Reset</Text>
          </Pressable>
        </View>
      </View>

      <TextInput
        ref={inputRef}
        style={[styles.input, { backgroundColor: col.card, borderColor: col.border, color: col.text, width: '100%' }]}
        value={filtro}
        onChangeText={setFiltro}
        placeholder="Filtrar logs…"
        placeholderTextColor={col.sub}
        autoCapitalize="none"
      />

      <ScrollView
        style={[{ borderRadius: 8, padding: 12, maxHeight: 200, width: '100%', backgroundColor: dark ? '#0a1520' : '#1e1e1e' }]}
        showsVerticalScrollIndicator={false}
      >
        {estado !== 'conectado' ? (
          <Text style={{ color: '#666', fontStyle: 'italic', fontSize: 12 }}>
            {estado === 'desconectado' || estado === 'error' ? 'Sin conexión — al conectar aparecen los logs' : 'Conectando…'}
          </Text>
        ) : filtrados.length === 0 ? (
          <Text style={{ color: '#666', fontStyle: 'italic', fontSize: 12 }}>Sin coincidencias</Text>
        ) : (
          filtrados.map((log, i) => <Text key={i} style={{ fontSize: 11, color: '#a8d8a8', lineHeight: 18 }}>{log}</Text>)
        )}
      </ScrollView>

      <Text style={[styles.cardSub, { color: col.sub, fontSize: 11 }]}>{Math.round(width)} dp</Text>
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
  input: { borderWidth: 1, borderColor: '#ccc', borderRadius: 8, paddingHorizontal: 12, paddingVertical: 10, fontSize: 14, backgroundColor: '#fff', color: '#1a1a1a' },
  btn: { paddingVertical: 12, borderRadius: 8, alignItems: 'center', paddingHorizontal: 20 },
  btnOn: { backgroundColor: '#1565c0' },
  btnGray: { backgroundColor: '#90a4ae' },
  btnT: { color: '#fff', fontWeight: '600', fontSize: 14 },
})
