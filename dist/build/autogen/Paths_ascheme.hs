module Paths_ascheme (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/krazy/.cabal/bin"
libdir     = "/home/krazy/.cabal/lib/ascheme-0.1.0.0/ghc-7.6.2"
datadir    = "/home/krazy/.cabal/share/ascheme-0.1.0.0"
libexecdir = "/home/krazy/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "ascheme_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ascheme_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ascheme_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ascheme_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
