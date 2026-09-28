      public class Example{
        public async Task<List<UtentiDTO>> GetFilteredUsers(string? username = null,
            string? name = null, string? surname = null, string? email = null, int? userTypeId = null, bool? deleted = false,
            CancellationToken cancellationToken = default)
        {
            IQueryable<Utenti> query = db.Utentis
                .Where(u => u.Deleted == deleted)
                .Include(u => u.UteTipoNavigation)
                .AsNoTracking();

            if (!string.IsNullOrEmpty(username))
            {
                query = query.Where(u => u.UteUsername!.Contains(username));
            }
            if (!string.IsNullOrEmpty(name))
            {
                query = query.Where(u => u.UteNome!.Contains(name));
            }
            if (!string.IsNullOrEmpty(surname))
            {
                query = query.Where(u => u.UteCognome!.Contains(surname));
            }
            if (!string.IsNullOrEmpty(email))
            {
                query = query.Where(u => u.UteEmail!.Contains(email));
            }

            if (userTypeId.HasValue)
            {
                query = query.Where(u => u.UteTipo == userTypeId.Value);
            }

            List<Utenti> entities = await query
                .OrderBy(u => u.UteNome)
                .ToListAsync(cancellationToken);

            return _mapper.Map<List<UtentiDTO>>(entities);
        }
        }