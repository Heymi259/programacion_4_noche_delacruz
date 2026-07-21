import { useWindowDimensions, useColorScheme, StyleSheet, Text, View } from 'react-native'

export default function Paso4() {
  const { width, height, scale } = useWindowDimensions()
  const esquema = useColorScheme()
  const dark = esquema === 'dark'

  const col = {
    bg: dark ? '#0d1b2a' : '#f5f5f5',
    card: dark ? '#1a2a3a' : '#fff',
    text: dark ? '#e8eaed' : '#1a1a1a',
    sub: dark ? '#9aa0a6' : '#666',
    border: dark ? '#2d3e50' : '#e0e0e0',
  }

  const cols = width > 500 ? 2 : 1
  const cardW = (width - 48 - (cols - 1) * 12) / cols

  const servers = [
    { n: 'web-01', ip: '10.0.2.10', ok: true },
    { n: 'db-01', ip: '10.0.2.20', ok: true },
    { n: 'cache-01', ip: '10.0.2.30', ok: false },
    { n: 'backup-01', ip: '10.0.2.40', ok: true },
  ]

  return (
    <View style={[styles.c, { backgroundColor: col.bg }]}>
      <Text style={[styles.t, { color: col.text }]}>Inventario de Servidores</Text>
      <View style={[styles.card, { backgroundColor: col.card, borderColor: col.border, width: '100%' }]}>
        <Text style={[styles.cardSub, { color: col.sub }]}>
          {Math.round(width)}×{Math.round(height)} dp · escala: {scale.toFixed(1)} · {esquema ?? 'auto'}
        </Text>
      </View>
      <View style={{ flexDirection: 'row', flexWrap: 'wrap', gap: 12 }}>
        {servers.map(srv => (
          <View key={srv.n} style={[styles.card, { backgroundColor: col.card, borderColor: col.border, width: cardW }]}>
            <Text style={[styles.cardTitle, { color: col.text }]}>{srv.n}</Text>
            <Text style={[styles.cardSub, { color: col.sub }]}>{srv.ip}</Text>
            <Text style={{ fontSize: 12, fontWeight: '600', color: srv.ok ? '#2e7d32' : '#c62828' }}>
              {srv.ok ? 'ACTIVO' : 'TIMEOUT'}
            </Text>
          </View>
        ))}
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  c: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, backgroundColor: '#f5f5f5', gap: 12 },
  t: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  card: { padding: 16, borderRadius: 10, borderWidth: 2, backgroundColor: '#fff', gap: 4 },
  cardTitle: { fontSize: 15, fontWeight: '600', color: '#1a1a1a' },
  cardSub: { fontSize: 13, color: '#666' },
})
