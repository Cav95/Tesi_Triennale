      public class Example{
        public async Task<ClientiDestinazioniDTO> GetLocationDetailsById(int? idLocation)
        {
            ClientiDestinazioni? location = await _db.ClientiDestinazionis
                .Where(l => l.CdeId == idLocation)
                .Include(l => l.CdeNazioneNavigation)
                .Include(l => l.CdeTipoNavigation)
                .Include(l => l.CdeClienteNavigation)
                .Include(l => l.CdeNormaElettricaNavigation)
                .Include(l => l.CdeZonaNavigation)
                .AsNoTracking()
                .FirstOrDefaultAsync();
            return _mapper.Map<ClientiDestinazioniDTO>(location!);
        }
        }