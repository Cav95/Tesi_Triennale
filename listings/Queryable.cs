      public class Example{
        public async Task<List<UtentiDTO>> GetFilteredUsers(string? username = null,
            string? name = null, string? surname = null, string? email = null, int? userTypeId = null, bool? deleted = false,
            CancellationToken cancellationToken = default)
        {
            // Check if the user has permission to read UtentiDTO
            await _permissionService.TryGetTablePermission(typeof(UtentiDTO), TypeOfOperation.READ,
            _utils.GetCurrentUserRoleId()).ConfigureAwait(false);

// Build the query to filter users based on the provided parameters
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

// Execute the query and retrieve the filtered list of users
            List<Utenti> entities = await query
                .OrderBy(u => u.UteNome)
                .ToListAsync(cancellationToken);

// Map the retrieved list of users to a list of UtentiDTO objects and return it
            return _mapper.Map<List<UtentiDTO>>(entities);
        }
        }